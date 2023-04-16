import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: 40,
        // ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        // const SizedBox(
        //   height: 20,
        // ),
        const Divider(
          thickness: 1,
          color: Color.fromARGB(255, 165, 163, 163),
          height: 5,
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
              DataColumn2(
                label: Text(
                  "Action",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ],
            rows: List<DataRow>.generate(
              15,
              (index) => DataRow(cells: [
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
                    "images",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const DataCell(
                  Text(
                    "Price",
                  ),
                ),
                DataCell(
                  SizedBox(
                      height: 25,
                      width: 60,
                      child: Material(
                        color: const Color.fromARGB(255, 212, 206, 206),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            child: Center(
                              child: Text(
                                "Edit",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        // child: Center(
                        //   child: Text(
                        //     'Edit',
                        //     style: TextStyle(
                        //         fontSize: 15,
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.w400),
                        //   ),
                        // ),
                      )),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
