import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailsProduct extends StatefulWidget {
  const DetailsProduct({super.key});

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  @override
  Widget build(BuildContext context) {
    return const Text('Product Details');
  }
}
