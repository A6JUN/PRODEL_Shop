import 'package:flutter/material.dart';
import 'package:prodel_shop/ui/screen/order_screen_sections/accepted_orders_screen.dart';
import 'package:prodel_shop/ui/screen/order_screen_sections/new_orders_screen.dart';
import 'package:prodel_shop/ui/screen/order_screen_sections/canceled_orders_screen.dart';
import 'package:prodel_shop/ui/screen/order_screen_sections/packed_orders_screen.dart';
import 'package:prodel_shop/ui/screen/order_screen_sections/delivered_orders_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
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
              height: 20,
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
                  label: 'New Orders',
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
                  label: 'Accepted Orders',
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
                  label: 'Packed Orders',
                  onTap: () {
                    _tabController!.animateTo(2);
                    setState(() {});
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                OrderTabItem(
                  isSelected: _tabController!.index == 3,
                  label: 'Delivered Orders',
                  onTap: () {
                    _tabController!.animateTo(3);
                    setState(() {});
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                OrderTabItem(
                  isSelected: _tabController!.index == 4,
                  label: 'Canceled',
                  onTap: () {
                    _tabController!.animateTo(4);
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
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  NewOrdersScreen(),
                  AcceptedOrdersScreen(),
                  PackedOrdersScreen(),
                  DeliveredOrdersScreen(),
                  CanceledOrdersScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrderTabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onTap;
  const OrderTabItem(
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
