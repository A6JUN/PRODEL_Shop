import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prodel_shop/ui/screen/widgets/custom_button.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Product type',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          // SizedBox(
          //   width: 280,
          //   height: 150,
          //   child: CustomButton(
          //     onTap: () {},
          //     label: 'Electronics',
          //   ),
          // )
        ],
      ),
    );
  }
}
