import 'package:flutter/material.dart';
import 'package:prodel_shop/ui/screen/product_screen_sections/add_products_screeen.dart';
import 'package:prodel_shop/ui/screen/product_screen_sections/details_products_screen.dart';
import 'package:prodel_shop/ui/screen/product_screen_sections/edit_products_screen.dart';

import 'order_screen.dart';

// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Order Management',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                OrderTabItem(
                  isSelected: _tabController!.index == 0,
                  label: 'Add product',
                  onTap: () {
                    _tabController!.animateTo(0);
                    setState(() {});
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                OrderTabItem(
                  isSelected: _tabController!.index == 1,
                  label: 'product details',
                  onTap: () {
                    _tabController!.animateTo(1);
                    setState(() {});
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                OrderTabItem(
                  isSelected: _tabController!.index == 2,
                  label: 'Edit Product',
                  onTap: () {
                    _tabController!.animateTo(2);
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  AddProduct(),
                  DetailsProduct(),
                  EditProduct(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
