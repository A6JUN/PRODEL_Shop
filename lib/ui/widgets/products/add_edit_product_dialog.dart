import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodel_shop/blocs/product/product_bloc.dart';
import 'package:prodel_shop/ui/widgets/category_select_box.dart';
import 'package:prodel_shop/ui/widgets/custom_action_button.dart';
import 'package:prodel_shop/ui/widgets/custom_alert_dialog.dart';
import 'package:prodel_shop/ui/widgets/custom_button.dart';
import 'package:prodel_shop/util/custom_file_picker.dart';

class AddEditProductDialog extends StatefulWidget {
  final Map<String, dynamic>? productDetails;
  const AddEditProductDialog({super.key, this.productDetails});

  @override
  State<AddEditProductDialog> createState() => _AddEditProductDialogState();
}

class _AddEditProductDialogState extends State<AddEditProductDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountedPriceController =
      TextEditingController();
  final TextEditingController _measurementController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  int? categoryId;
  PlatformFile? selectedFile;

  @override
  void initState() {
    if (widget.productDetails != null) {
      _nameController.text = widget.productDetails!['name'];
      _descriptionController.text = widget.productDetails!['description'];
      _priceController.text = widget.productDetails!['price'].toString();
      _discountedPriceController.text =
          widget.productDetails!['discounted_price'].toString();
      _measurementController.text = widget.productDetails!['measurement'];
      _quantityController.text = widget.productDetails!['quantity'];
      _stockController.text = widget.productDetails!['stock'].toString();
      categoryId = widget.productDetails!['category']['id'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          width: 1,
          color: Colors.black26,
        ),
      ),
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productDetails != null
                                ? 'Edit Product'
                                : 'Add Product',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.productDetails != null
                                ? 'Change the following details and save to apply them'
                                : 'Enter the following details to add a product.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Product Name',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if ((value != null && value.trim().isNotEmpty) ||
                        widget.productDetails != null) {
                      return null;
                    } else {
                      return 'Please enter your product name';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'eg.Some name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 2,
                  validator: (value) {
                    if ((value != null && value.trim().isNotEmpty) ||
                        widget.productDetails != null) {
                      return null;
                    } else {
                      return 'Please enter product description';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'eg.Some description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                ),
                const Divider(
                  height: 30,
                  color: Color.fromARGB(66, 176, 176, 176),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Stock',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _stockController,
                            validator: (value) {
                              if ((value != null && value.trim().isNotEmpty) ||
                                  widget.productDetails != null) {
                                return null;
                              } else {
                                return 'Please enter current stock';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'eg.10',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Category',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          CategorySelectBox(
                            selectedCategory: widget.productDetails != null
                                ? categoryId
                                : null,
                            onSelect: (id) {
                              categoryId = id;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Color.fromARGB(66, 176, 176, 176),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _priceController,
                            validator: (value) {
                              if ((value != null && value.trim().isNotEmpty) ||
                                  widget.productDetails != null) {
                                return null;
                              } else {
                                return 'Please enter price';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'eg.100',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Discounted Price',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _discountedPriceController,
                            validator: (value) {
                              if ((value != null && value.trim().isNotEmpty) ||
                                  widget.productDetails != null) {
                                return null;
                              } else {
                                return 'Please enter discounted price';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'eg.50',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Color.fromARGB(66, 176, 176, 176),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Measurement',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _measurementController,
                            validator: (value) {
                              if ((value != null && value.trim().isNotEmpty) ||
                                  widget.productDetails != null) {
                                return null;
                              } else {
                                return 'Please enter measurement';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'eg.KG',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quantity',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _quantityController,
                            validator: (value) {
                              if ((value != null && value.trim().isNotEmpty) ||
                                  widget.productDetails != null) {
                                return null;
                              } else {
                                return 'Please enter quantity';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'eg.1 Box',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomActionButton(
                  iconData: Icons.upload_rounded,
                  color:
                      selectedFile != null ? Colors.green : Colors.grey[800]!,
                  onPressed: () async {
                    PlatformFile? file = await pickFile();
                    if (file != null) {
                      selectedFile = file;
                      setState(() {});
                    }
                  },
                  label: 'Image Upload',
                ),
                const Divider(
                  height: 30,
                  color: Color.fromARGB(66, 176, 176, 176),
                ),
                CustomButton(
                  label: widget.productDetails != null ? 'Save' : 'Add',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.productDetails != null) {
                        BlocProvider.of<ProductBloc>(context).add(
                          EditProductEvent(
                            name: _nameController.text.trim(),
                            description: _descriptionController.text.trim(),
                            measurement: _measurementController.text.trim(),
                            quantity: _quantityController.text.trim(),
                            categoryId: categoryId!,
                            price: int.parse(
                                _priceController.text.trim().toString()),
                            discountedPrice: int.parse(
                                _discountedPriceController.text
                                    .trim()
                                    .toString()),
                            stock: int.parse(
                                _stockController.text.trim().toString()),
                            productId: widget.productDetails!['id'],
                          ),
                        );

                        Navigator.pop(context);
                      } else {
                        if (categoryId == null) {
                          showDialog(
                            context: context,
                            builder: (context) => const CustomAlertDialog(
                              title: 'Required !',
                              message:
                                  'Product Category is required. Please select product category to continue',
                              primaryButtonLabel: 'Ok',
                            ),
                          );
                        } else if (selectedFile == null) {
                          showDialog(
                            context: context,
                            builder: (context) => const CustomAlertDialog(
                              title: 'Required !',
                              message:
                                  'Product image is required. Please select image to continue',
                              primaryButtonLabel: 'Ok',
                            ),
                          );
                        } else {
                          BlocProvider.of<ProductBloc>(context).add(
                            AddProductEvent(
                              name: _nameController.text.trim(),
                              description: _descriptionController.text.trim(),
                              measurement: _measurementController.text.trim(),
                              quantity: _quantityController.text.trim(),
                              categoryId: categoryId!,
                              price: int.parse(
                                  _priceController.text.trim().toString()),
                              discountedPrice: int.parse(
                                  _discountedPriceController.text
                                      .trim()
                                      .toString()),
                              stock: int.parse(
                                  _stockController.text.trim().toString()),
                              image: selectedFile!,
                            ),
                          );

                          Navigator.pop(context);
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
