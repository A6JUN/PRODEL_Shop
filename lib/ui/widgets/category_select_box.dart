import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodel_shop/blocs/product_category/product_category_bloc.dart';
import 'package:prodel_shop/values/colors.dart';

import 'custom_alert_dialog.dart';

class CategorySelectBox extends StatefulWidget {
  final Function(int) onSelect;
  final int? selectedCategory;
  const CategorySelectBox({
    super.key,
    required this.onSelect,
    this.selectedCategory,
  });

  @override
  State<CategorySelectBox> createState() => _CategorySelectBoxState();
}

class _CategorySelectBoxState extends State<CategorySelectBox> {
  final ProductCategoryBloc productCategoryBloc = ProductCategoryBloc();
  int? selectedId;
  @override
  void initState() {
    productCategoryBloc.add(GetAllProductCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCategoryBloc>.value(
      value: productCategoryBloc,
      child: BlocConsumer<ProductCategoryBloc, ProductCategoryState>(
        listener: (context, state) {
          if (state is ProductCategoryFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failed!',
                message: state.message,
                primaryButtonLabel: 'Retry',
                primaryOnPressed: () {
                  productCategoryBloc.add(GetAllProductCategoryEvent());
                  Navigator.pop(context);
                },
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductCategorySuccessState) {
            return Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              child: DropdownButton(
                borderRadius: BorderRadius.circular(20),
                isExpanded: true,
                underline: const SizedBox(),
                hint: Text(
                  'Select Category',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                      ),
                ),
                value: selectedId ?? widget.selectedCategory,
                onChanged: (value) {
                  widget.onSelect(value);
                  selectedId = value;
                  setState(() {});
                },
                items: List<DropdownMenuItem>.generate(
                  state.productCategories.length,
                  (index) => DropdownMenuItem(
                    value: state.productCategories[index]['id'],
                    child: Text(
                      state.productCategories[index]['name'],
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
              ),
            );
          } else if (state is ProductCategoryFailureState) {
            return const SizedBox();
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
