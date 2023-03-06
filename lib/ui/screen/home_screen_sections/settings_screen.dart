import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Color.fromARGB(217, 244, 239, 239),
          title: Text(
            'Settings',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w900, color: Colors.black),
          ),
        ),
      ),
    ));
  }
}
