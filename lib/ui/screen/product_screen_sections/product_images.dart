import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodel_shop/blocs/product/product_bloc.dart';
import 'package:prodel_shop/ui/widgets/custom_action_button.dart';
import 'package:prodel_shop/ui/widgets/custom_alert_dialog.dart';
import 'package:prodel_shop/ui/widgets/custom_progress_indicator.dart';
import 'package:prodel_shop/util/custom_file_picker.dart';
import 'package:prodel_shop/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductImagesScreen extends StatefulWidget {
  final List<Map<String, dynamic>> images;
  final int productId;
  const ProductImagesScreen(
      {super.key, required this.images, required this.productId});

  @override
  State<ProductImagesScreen> createState() => _ProductImagesScreenState();
}

class _ProductImagesScreenState extends State<ProductImagesScreen> {
  final ProductBloc productBloc = ProductBloc();

  PlatformFile? selectedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
        ),
      ),
      body: BlocProvider<ProductBloc>.value(
        value: productBloc,
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductImageDeleteSuccessState) {
              Navigator.pop(context);
            } else if (state is ProductImageUploadSuccessState) {
              Navigator.pop(context);
            } else if (state is ProductFailureState) {
              showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  message: state.message,
                  title: 'Failure',
                  primaryButtonLabel: 'Ok',
                ),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: SizedBox(
                width: 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Images',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        CustomActionButton(
                          color: primaryColor,
                          onPressed: () async {
                            PlatformFile? file = await pickFile();
                            if (file != null) {
                              selectedFile = file;
                              productBloc.add(
                                UploadProductImageEvent(
                                  image: selectedFile!,
                                  productId: widget.productId,
                                ),
                              );
                            }
                          },
                          label: 'Add Image',
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 165, 163, 163),
                      height: 30,
                    ),
                    widget.images.isNotEmpty
                        ? Expanded(
                            child: state is ProductLoadingState
                                ? const Center(
                                    child: CustomProgressIndicator(),
                                  )
                                : state is ProductFailureState
                                    ? Center(
                                        child: CustomActionButton(
                                          onPressed: () {
                                            productBloc
                                                .add(GetAllProductsEvent());
                                          },
                                          label: 'Retry',
                                          iconData: Icons.refresh_outlined,
                                          mainAxisSize: MainAxisSize.min,
                                        ),
                                      )
                                    : Wrap(
                                        spacing: 15,
                                        runSpacing: 15,
                                        children: List<Widget>.generate(
                                          widget.images.length,
                                          (index) => ImageItem(
                                            image: widget.images[index],
                                            onDelete: () {
                                              if (widget.images[index]
                                                      ['priority'] ==
                                                  1) {
                                                showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      const CustomAlertDialog(
                                                    message:
                                                        'This is a high priority image. So you can\'t delete this image. To change the image, go to edit section of the product and upload a new image',
                                                    title:
                                                        'High Priority Image',
                                                    primaryButtonLabel: 'Ok',
                                                  ),
                                                );
                                              } else {
                                                productBloc.add(
                                                  DeleteProductImageEvent(
                                                    id: widget.images[index]
                                                        ['id'],
                                                    imageUrl: widget
                                                        .images[index]['url'],
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                          )
                        : const Text(
                            'No images found',
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final Map<String, dynamic> image;
  final Function() onDelete;
  const ImageItem({
    super.key,
    required this.image,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          width: 0.8,
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                onDelete();
              },
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: Colors.red,
                size: 20,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: image['url'],
                fit: BoxFit.cover,
                height: 150,
                width: 150,
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(child: CustomProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
