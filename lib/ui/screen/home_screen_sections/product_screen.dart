import 'package:flutter/material.dart';
import 'package:prodel_shop/ui/screen/product_screen_sections/add_product.dart';
import 'package:prodel_shop/ui/screen/product_screen_sections/edit_product.dart';

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
      length: 2,
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
              'Product Management',
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
                  label: 'Edit Product',
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
                  label: 'Add product',
                  onTap: () {
                    _tabController!.animateTo(1);
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: const [
                  EditProduct(),
                  AddProduct(),
                ],
              ),
            )

            // Material(
            //   color: Colors.yellow,
            //   child: InkWell(
            //     onTap: () {},
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //       child: Text(
            //         "Add",
            //         style: Theme.of(context).textTheme.titleMedium!.copyWith(
            //               fontWeight: FontWeight.w900,
            //               color: Colors.black,
            //             ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ProductTabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onTap;
  const ProductTabItem(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onTap,
      required});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(
                  height: isSelected ? 5 : 0,
                ),
                isSelected
                    ? Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
