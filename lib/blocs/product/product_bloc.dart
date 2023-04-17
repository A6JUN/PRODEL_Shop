import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('products');
      SupabaseQueryBuilder imagesQueryTable =
          supabaseClient.from('product_images');
      try {
        if (event is GetAllProductsEvent) {
          List<dynamic> temp = (await supabaseClient.rpc(
                'get_products',
                params: {
                  'search_category_id': event.categoryId,
                  'search_query': event.query,
                },
              )) ??
              [];

          List<Map<String, dynamic>> products = temp.map((e) {
            Map<String, dynamic> product = e as Map<String, dynamic>;
            List<dynamic> tempImages = product['images'];
            List<Map<String, dynamic>> images = tempImages
                .map((image) => image as Map<String, dynamic>)
                .toList();
            product['images'] = images;
            return product;
          }).toList();

          Logger().wtf(products);

          emit(
            ProductSuccessState(
              products: products,
            ),
          );
        } else if (event is AddProductEvent) {
          Uint8List file = event.image.bytes!;
          String path = await supabaseClient.storage.from('docs').uploadBinary(
                'images/${DateTime.now().millisecondsSinceEpoch.toString()}${event.image.name}',
                file,
              );

          path = path.replaceRange(0, 5, '');

          String url = supabaseClient.storage.from('docs').getPublicUrl(path);

          Logger().wtf(url);

          Map<String, dynamic> product = await queryTable
              .insert({
                'name': event.name,
                'description': event.description,
                'category_id': event.categoryId,
                'price': event.price,
                'discounted_price': event.discountedPrice,
                'measurement': event.measurement,
                'quantity': event.quantity,
                'stock': event.stock,
                'shop_id': supabaseClient.auth.currentUser!.id,
              })
              .select()
              .single();

          if (product.isNotEmpty) {
            await imagesQueryTable.insert(
              {
                'product_id': product['id'],
                'image_url': url,
                'priority': 1,
              },
            );
          }

          add(GetAllProductsEvent());
        } else if (event is EditProductEvent) {
          if (event.image != null) {
            await imagesQueryTable
                .delete()
                .eq('product_id', event.productId)
                .eq('priority', 1);

            Uint8List file = event.image!.bytes!;
            String path =
                await supabaseClient.storage.from('docs').uploadBinary(
                      'images/${DateTime.now().millisecondsSinceEpoch.toString()}${event.image!.name}',
                      file,
                    );

            path = path.replaceRange(0, 5, '');

            String url = supabaseClient.storage.from('docs').getPublicUrl(path);
            await imagesQueryTable.insert(
              {
                'product_id': event.productId,
                'image_url': url,
                'priority': 1,
              },
            );
          }

          await queryTable.update({
            'name': event.name,
            'description': event.description,
            'category_id': event.categoryId,
            'price': event.price,
            'discounted_price': event.discountedPrice,
            'measurement': event.measurement,
            'quantity': event.quantity,
            'stock': event.stock,
            'shop_id': supabaseClient.auth.currentUser!.id,
          }).eq('id', event.productId);

          add(GetAllProductsEvent());
        } else if (event is DeleteProductEvent) {
          await queryTable.delete().eq(
                'id',
                event.productId,
              );
          add(GetAllProductsEvent());
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ProductFailureState(message: e.toString()));
      }
    });
  }
}
