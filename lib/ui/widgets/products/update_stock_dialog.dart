import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodel_shop/blocs/product/product_bloc.dart';
import 'package:prodel_shop/ui/widgets/category_select_box.dart';
import 'package:prodel_shop/ui/widgets/custom_action_button.dart';
import 'package:prodel_shop/ui/widgets/custom_alert_dialog.dart';
import 'package:prodel_shop/ui/widgets/custom_button.dart';
import 'package:prodel_shop/util/custom_file_picker.dart';

class UpdateStockDialog extends StatefulWidget {
  final Map<String, dynamic> productDetails;
  const UpdateStockDialog({super.key, required this.productDetails});

  @override
  State<UpdateStockDialog> createState() => _UpdateStockDialogState();
}

class _UpdateStockDialogState extends State<UpdateStockDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _stockController = TextEditingController();

  @override
  void initState() {
    if (widget.productDetails.isNotEmpty) {
      _stockController.text = widget.productDetails['stock'].toString();
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
        width: 350,
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
                            'Update Stock',
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
                            'Enter the following details to update stock.',
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
                  'Stock',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _stockController,
                  validator: (value) {
                    if ((value != null && value.trim().isNotEmpty) ||
                        widget.productDetails.isNotEmpty) {
                      return null;
                    } else {
                      return 'Please enter current stock';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'eg.10',
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
                CustomButton(
                  label: 'Save',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<ProductBloc>(context).add(
                        UpdateStockEvent(
                          productId: widget.productDetails['id'],
                          stock: int.parse(
                              _stockController.text.trim().toString()),
                        ),
                      );

                      Navigator.pop(context);
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
