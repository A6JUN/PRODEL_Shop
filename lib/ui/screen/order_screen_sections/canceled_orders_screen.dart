import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CanceledOrdersScreen extends StatefulWidget {
  const CanceledOrdersScreen({super.key});

  @override
  State<CanceledOrdersScreen> createState() => _CanceledOrdersScreenState();
}

class _CanceledOrdersScreenState extends State<CanceledOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Canceled Orders',
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
    );
  }
}
