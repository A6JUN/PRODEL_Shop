import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Inventory Management',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(
            height: 20,
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
                    "Product_ID",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                DataColumn2(
                  label: Text(
                    "Product Type",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                DataColumn2(
                  label: Text(
                    "Product Name",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                DataColumn2(
                  label: Text(
                    "weight",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                DataColumn2(
                  label: Text(
                    "Quantity",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                DataColumn2(
                  label: Text(
                    "Photo",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                DataColumn2(
                  label: Text(
                    "Price",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                15,
                (index) => DataRow(
                  cells: [
                    DataCell(
                      Text(
                        index.toString(),
                      ),
                    ),
                    const DataCell(
                      Text(
                        "Type",
                      ),
                    ),
                    const DataCell(
                      Text(
                        "Name",
                      ),
                    ),
                    const DataCell(
                      Text(
                        "weight",
                      ),
                    ),
                    const DataCell(
                      Text(
                        "Stock",
                      ),
                    ),
                    const DataCell(
                      Text(
                        "images",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    const DataCell(
                      Text(
                        "Price",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
