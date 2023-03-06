import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(217, 244, 239, 239),
        title: Text(
          'Staff Management',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.black),
        ),
      ),
    );
  }
}
