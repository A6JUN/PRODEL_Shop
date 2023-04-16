import 'package:flutter/material.dart';

class ShopInfoScreen extends StatefulWidget {
  const ShopInfoScreen({super.key});

  @override
  State<ShopInfoScreen> createState() => _ShopInfoScreenState();
}

class _ShopInfoScreenState extends State<ShopInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          Text('Shop Info'),
        ],
      ),
    );
  }
}
