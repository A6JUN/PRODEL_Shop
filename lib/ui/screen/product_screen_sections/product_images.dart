import 'package:flutter/material.dart';
import 'package:prodel_shop/ui/widgets/custom_action_button.dart';
import 'package:prodel_shop/ui/widgets/custom_progress_indicator.dart';
import 'package:prodel_shop/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductImagesScreen extends StatefulWidget {
  final List<Map<String, dynamic>> images;
  const ProductImagesScreen({super.key, required this.images});

  @override
  State<ProductImagesScreen> createState() => _ProductImagesScreenState();
}

class _ProductImagesScreenState extends State<ProductImagesScreen> {
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
      body: Center(
        child: SizedBox(
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Images',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  CustomActionButton(
                    color: primaryColor,
                    onPressed: () {},
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
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: List<Widget>.generate(
                          widget.images.length,
                          (index) => ImageItem(
                            image: widget.images[index],
                            onDelete: (id) {},
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
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final Map<String, dynamic> image;
  final Function(int id) onDelete;
  const ImageItem({
    super.key,
    required this.image,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: image['url'],
          fit: BoxFit.cover,
          height: 200,
          width: 200,
          progressIndicatorBuilder: (context, url, progress) =>
              const Center(child: CustomProgressIndicator()),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                onDelete(image['id']);
              },
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
