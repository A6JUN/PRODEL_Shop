import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CompletedOrdersScreen extends StatefulWidget {
  const CompletedOrdersScreen({super.key});

  @override
  State<CompletedOrdersScreen> createState() => _CompletedOrdersScreenState();
}

class _CompletedOrdersScreenState extends State<CompletedOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Completed Orders',
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Customer",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Order",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Delivery Date",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Delivery Pricing",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Delivery Status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              DataColumn2(
                label: Text(
                  "Payment",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                    "Completed",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                const DataCell(
                  Text(
                    "Payment",
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
