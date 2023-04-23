import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prodel_shop/ui/widgets/custom_action_button.dart';
import 'package:prodel_shop/ui/widgets/custom_icon_button.dart';
import 'package:prodel_shop/ui/widgets/custom_search.dart';
import 'package:prodel_shop/ui/widgets/label_with_text.dart';
import 'package:prodel_shop/ui/widgets/orders/order_status_item.dart';
import 'package:prodel_shop/values/colors.dart';

import '../../../blocs/manage_order/manage_order_bloc.dart';
import '../../widgets/custom_alert_dialog.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String orderStatus = 'pending';
  final ManageOrderBloc manageOrdersBloc = ManageOrderBloc();

  void getOrders() {
    manageOrdersBloc.add(GetAllOrderEvent(status: orderStatus));
  }

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider<ManageOrderBloc>.value(
        value: manageOrdersBloc,
        child: BlocConsumer<ManageOrderBloc, ManageOrderState>(
          listener: (context, state) {
            if (state is ManageOrderFailureState) {
              showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  message: state.message,
                  title: 'Failure',
                  primaryButtonLabel: 'Ok',
                ),
              );
            }
          },
          builder: (context, state) {
            return SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Orders',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      OrderStatusItem(
                        iconData: Icons.pending_actions_outlined,
                        isSelected: orderStatus == 'pending',
                        label: 'Pending',
                        onTap: () {
                          orderStatus = 'pending';
                          setState(() {});
                          getOrders();
                        },
                        orderStatus:
                            orderStatus == 'pending' ? 'pending' : null,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      OrderStatusItem(
                        iconData: Icons.local_shipping_outlined,
                        isSelected: orderStatus == 'packed',
                        label: 'Packed',
                        onTap: () {
                          orderStatus = 'packed';
                          setState(() {});
                          getOrders();
                        },
                        orderStatus: orderStatus == 'packed' ? 'packed' : null,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      OrderStatusItem(
                        iconData: Icons.done_all_outlined,
                        isSelected: orderStatus == 'complete',
                        label: 'Completed',
                        onTap: () {
                          orderStatus = 'complete';
                          setState(() {});
                          getOrders();
                        },
                        orderStatus:
                            orderStatus == 'complete' ? 'complete' : null,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 165, 163, 163),
                    height: 30,
                  ),
                  state is ManageOrderSuccessState
                      ? state.orders.isNotEmpty
                          ? Expanded(
                              child: DataTable2(
                                columnSpacing: 12,
                                horizontalMargin: 12,
                                columns: [
                                  DataColumn2(
                                    size: ColumnSize.S,
                                    fixedWidth: 60,
                                    label: Text(
                                      "#ID",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  DataColumn2(
                                    size: ColumnSize.M,
                                    label: Text(
                                      "Customer",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  DataColumn2(
                                    fixedWidth: 130,
                                    size: ColumnSize.M,
                                    label: Text(
                                      "Total Price (₹)",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  DataColumn2(
                                    size: ColumnSize.S,
                                    label: Text(
                                      "Date",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  DataColumn2(
                                    size: ColumnSize.S,
                                    label: Text(
                                      "Order Type",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  DataColumn2(
                                    size: ColumnSize.L,
                                    label: Text(
                                      "Actions",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  state.orders.length,
                                  (index) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(state.orders[index]['id']
                                            .toString()),
                                      ),
                                      DataCell(
                                        Text(
                                          state.orders[index]['user']['name'],
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          state.orders[index]['total']
                                              .toString(),
                                        ),
                                      ),
                                      DataCell(
                                        Text(DateFormat('dd/MM/yyyy hh:mm a')
                                            .format(DateTime.parse(
                                                    state.orders[index]
                                                        ['created_at'])
                                                .toLocal())),
                                      ),
                                      DataCell(
                                        Text(
                                          state.orders[index]['order_type'],
                                        ),
                                      ),
                                      DataCell(
                                        Wrap(
                                          children: [
                                            CustomActionButton(
                                              mainAxisSize: MainAxisSize.min,
                                              label: 'Products',
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      OrderProductsDialog(
                                                    orderItems: state
                                                        .orders[index]['items'],
                                                  ),
                                                );
                                              },
                                              color: Colors.purple,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CustomActionButton(
                                              mainAxisSize: MainAxisSize.min,
                                              label: 'Customer',
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      CustomerDetails(
                                                    orderDetails:
                                                        state.orders[index],
                                                  ),
                                                );
                                              },
                                            ),
                                            if (state.orders[index]['status'] ==
                                                'pending')
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            if (state.orders[index]['status'] ==
                                                'pending')
                                              CustomActionButton(
                                                mainAxisSize: MainAxisSize.min,
                                                label: 'Packed',
                                                color: Colors.deepOrange,
                                                iconData: Icons.done,
                                                onPressed: () {
                                                  manageOrdersBloc.add(
                                                    HandleOrderEvent(
                                                      orderId: state
                                                          .orders[index]['id'],
                                                      status: 'packed',
                                                    ),
                                                  );
                                                },
                                              ),
                                            if (state.orders[index]['status'] ==
                                                    'packed' &&
                                                state.orders[index]
                                                        ['order_type'] ==
                                                    'delivery')
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            if (state.orders[index]['status'] ==
                                                    'packed' &&
                                                state.orders[index]
                                                        ['order_type'] ==
                                                    'delivery')
                                              CustomActionButton(
                                                mainAxisSize: MainAxisSize.min,
                                                label: 'Completed',
                                                color: Colors.green,
                                                iconData: Icons.done_all,
                                                onPressed: () {
                                                  manageOrdersBloc.add(
                                                    HandleOrderEvent(
                                                      orderId: state
                                                          .orders[index]['id'],
                                                      status: 'complete',
                                                    ),
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const Center(
                              child: Text('No Orders Found'),
                            )
                      : const Center(child: CupertinoActivityIndicator()),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomerDetails extends StatelessWidget {
  final dynamic orderDetails;
  const CustomerDetails({
    super.key,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      width: 500,
      title: 'Customer Details',
      message: 'Details of the customer',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabelWithText(
                label: 'Name',
                text: orderDetails['user']['name'],
              ),
              LabelWithText(
                crossAxisAlignment: CrossAxisAlignment.end,
                label: 'Phone Number',
                text: orderDetails['user']['phone'],
              ),
            ],
          ),
          if (orderDetails['order_type'] == 'delivery')
            const Divider(height: 30),
          if (orderDetails['order_type'] == 'delivery')
            LabelWithText(label: 'Address', text: orderDetails['address']),
          if (orderDetails['order_type'] == 'delivery')
            const SizedBox(height: 10),
          if (orderDetails['order_type'] == 'delivery')
            LabelWithText(
              label: 'Pin',
              text: orderDetails['pin'].toString(),
            ),
        ],
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

class OrderProductsDialog extends StatelessWidget {
  final List<dynamic> orderItems;
  const OrderProductsDialog({
    super.key,
    required this.orderItems,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      width: 600,
      title: 'Products',
      message: 'Products on the order',
      content: Flexible(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  index == 0 ? "#ID" : orderItems[index - 1]['id'].toString(),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight:
                          index == 0 ? FontWeight.bold : FontWeight.normal),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  index == 0
                      ? "Name"
                      : orderItems[index - 1]['product']['name'],
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight:
                          index == 0 ? FontWeight.bold : FontWeight.normal),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    index == 0
                        ? "Quantity"
                        : orderItems[index - 1]['quantity'].toString(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight:
                            index == 0 ? FontWeight.bold : FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    index == 0
                        ? "Price"
                        : orderItems[index - 1]['price'].toString(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight:
                            index == 0 ? FontWeight.bold : FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: orderItems.length + 1,
        ),
      ),
    );
  }
}
