import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AcceptedOrdersScreen extends StatefulWidget {
  const AcceptedOrdersScreen({super.key});

  @override
  State<AcceptedOrdersScreen> createState() => _AcceptedOrdersScreenState();
}

class _AcceptedOrdersScreenState extends State<AcceptedOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Accepted Orders',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
        const Divider(
          thickness: 1,
          color: Color.fromARGB(255, 165, 163, 163),
          height: 50,
        ),
        Expanded(
          child: DataTable2(
            columns: const [
              DataColumn2(
                label: Text(
                  "Order_ID",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Customer",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Order",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Delivery Date",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Delivery Pricing",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Delivery Status",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Payment",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Type",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ],
            rows: List<DataRow>.generate(
              10,
              (index) => DataRow(cells: [
                DataCell(
                  Text(
                    index.toString(),
                  ),
                ),
                const DataCell(
                  Text(
                    "Name",
                  ),
                ),
                const DataCell(
                  Text(
                    "Order",
                  ),
                ),
                const DataCell(
                  Text(
                    "Date",
                  ),
                ),
                const DataCell(
                  Text(
                    "Price",
                  ),
                ),
                const DataCell(
                  Text(
                    "Status",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                const DataCell(
                  Text(
                    "Payment",
                  ),
                ),
                const DataCell(
                  Text(
                    "Pre_order/Delivery",
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
