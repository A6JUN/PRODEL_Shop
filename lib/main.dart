import 'package:flutter/material.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/home_screen.dart';
import 'package:prodel_shop/ui/screen/login_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/order_screen.dart';
import 'package:prodel_shop/ui/screen/signup_screen.dart';
import 'package:prodel_shop/ui/screen/widgets/scroller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUpScreen());
  }
}
