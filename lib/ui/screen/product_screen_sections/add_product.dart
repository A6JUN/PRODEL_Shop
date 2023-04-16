import 'package:date_field/date_field.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Grocery',
  'Stationary',
];

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 1,
          color: Color.fromARGB(255, 165, 163, 163),
          height: 5,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Product Type',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                  underline: Container(
                    height: 3,
                    width: 15,
                    color: const Color.fromARGB(255, 44, 14, 246),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'Product Name',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 300,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 44, 14, 246)))),
                    minLines: 1,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Brand',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 300,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 44, 14, 246)))),
                    minLines: 1,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 350,
                  height: 150,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 44, 14, 246)))),
                    minLines: 5,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Maximum Retail Price',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 44, 14, 246)))),
                    minLines: 5,
                    maxLines: 5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Quantity',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputQty(
                  iconColor: const Color.fromARGB(255, 44, 14, 246),
                  maxVal: double.maxFinite,
                  initVal: 0,
                  onQtyChanged: (val) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Weight',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 250,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 44, 14, 246)))),
                    minLines: 1,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // SizedBox(
                //   height: 20,
                //   child: CupertinoDatePicker(
                //     mode: CupertinoDatePickerMode.dateAndTime,
                //     initialDateTime: DateTime(1969, 1, 1, 11, 33),
                //     onDateTimeChanged: (DateTime newDateTime) {
                //       //Do Some thing
                //     },
                //     use24hFormat: false,
                //     minuteInterval: 1,
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              width: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: DateTimeFormField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.timer),
                          labelText: 'Time',
                        ),
                        mode: DateTimeFieldPickerMode.time,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {},
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: DateTimeFormField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note),
                          labelText: 'Date',
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'image',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: Material(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: Material(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            width: 2, color: Color.fromARGB(255, 44, 14, 246))),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Center(
                          child: Text(
                            "ADD",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: const Color.fromARGB(255, 44, 14, 246),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(height: 30,width: 150, child: Material(color: Colors.grey,child: ))
                // // const Text(
                //   'Image',
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   height: 150,
                //   width: 150,
                //   color: Colors.black,
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Column(
                //   children: const [
                //     Text(
                //       'Colors Description',
                //       style:
                //           TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                //     ),
                //     SizedBox(
                //       width: 250,
                //       child: TextField(
                //         cursorColor: Colors.black,
                //         decoration: InputDecoration(
                //             filled: true,
                //             border: OutlineInputBorder(
                //                 borderSide: BorderSide(color: Colors.black)),
                //             focusedBorder: OutlineInputBorder(
                //                 borderSide: BorderSide(
                //                     color: Color.fromARGB(255, 44, 14, 246)))),
                //         minLines: 1,
                //         maxLines: 2,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
