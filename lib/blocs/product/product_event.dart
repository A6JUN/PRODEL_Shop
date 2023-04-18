part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class AddProductEvent extends ProductEvent {
  final String name, description, measurement, quantity;
  final int categoryId, price, discountedPrice, stock;
  final PlatformFile image;

  AddProductEvent({
    required this.name,
    required this.description,
    required this.measurement,
    required this.quantity,
    required this.categoryId,
    required this.price,
    required this.discountedPrice,
    required this.stock,
    required this.image,
  });
}

class EditProductEvent extends ProductEvent {
  final String name, description, measurement, quantity;
  final int categoryId, price, discountedPrice, stock, productId;
  final PlatformFile? image;

  EditProductEvent({
    required this.name,
    required this.description,
    required this.measurement,
    required this.quantity,
    required this.categoryId,
    required this.price,
    required this.discountedPrice,
    required this.stock,
    this.image,
    required this.productId,
  });
}

class DeleteProductEvent extends ProductEvent {
  final int productId;

  DeleteProductEvent({
    required this.productId,
  });
}

class DeleteProductImageEvent extends ProductEvent {
  final int id;
  final String imageUrl;

  DeleteProductImageEvent({
    required this.id,
    required this.imageUrl,
  });
}

class UpdateStockEvent extends ProductEvent {
  final int productId, stock;

  UpdateStockEvent({
    required this.productId,
    required this.stock,
  });
}

class UploadProductImageEvent extends ProductEvent {
  final PlatformFile image;
  final int productId;

  UploadProductImageEvent({
    required this.image,
    required this.productId,
  });
}

class GetAllProductsEvent extends ProductEvent {
  final String? query;
  final int? categoryId, shopId;

  GetAllProductsEvent({
    this.query,
    this.categoryId,
    this.shopId,
  });
}
