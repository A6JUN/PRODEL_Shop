import 'package:flutter/material.dart';
import 'package:prodel_shop/ui/widgets/orders/order_status_item.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderStatus orderStatus = OrderStatus.pending;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OrderStatusItem(
                    iconData: Icons.pending_actions_outlined,
                    isSelected: orderStatus == OrderStatus.pending,
                    label: 'Pending',
                    onTap: () {
                      orderStatus = OrderStatus.pending;
                      setState(() {});
                    },
                    orderStatus: orderStatus == OrderStatus.pending
                        ? OrderStatus.pending
                        : null,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: OrderStatusItem(
                    iconData: Icons.local_shipping_outlined,
                    isSelected: orderStatus == OrderStatus.packed,
                    label: 'Packed',
                    onTap: () {
                      orderStatus = OrderStatus.packed;
                      setState(() {});
                    },
                    orderStatus: orderStatus == OrderStatus.packed
                        ? OrderStatus.packed
                        : null,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: OrderStatusItem(
                    iconData: Icons.done_all_outlined,
                    isSelected: orderStatus == OrderStatus.complete,
                    label: 'Completed',
                    onTap: () {
                      orderStatus = OrderStatus.complete;
                      setState(() {});
                    },
                    orderStatus: orderStatus == OrderStatus.complete
                        ? OrderStatus.complete
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Wrap(
                runSpacing: 10,
                children: [
                  Text(
                    orderStatus == OrderStatus.pending
                        ? 'Pending'
                        : orderStatus == OrderStatus.packed
                            ? 'Packed'
                            : 'Completed',
                  )
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
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.grey[50],
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
