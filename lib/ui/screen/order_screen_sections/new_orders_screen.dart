import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class NewOrdersScreen extends StatefulWidget {
  const NewOrdersScreen({super.key});

  @override
  State<NewOrdersScreen> createState() => _NewOrdersScreenState();
}

class _NewOrdersScreenState extends State<NewOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'New Orders',
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
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Customer",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Order",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Delivery Date",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Delivery Pricing",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Delivery Status",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Payment",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Type",
                  style: TextStyle(fontWeight: FontWeight.w900),
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
                    style: TextStyle(color: Colors.blue),
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
