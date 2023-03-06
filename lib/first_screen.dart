import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/home_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/login_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/signup_screen.dart';
import 'package:prodel_shop/ui/screen/widgets/custom_button.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: Column(
          children: [
            SizedBox(
              height: 230,
            ),
            CustomButton(
              label: 'Login',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
            // SizedBox(
            //   width: 350,
            //   child: TextField(
            //     textAlign: TextAlign.center,
            //     decoration: InputDecoration(
            //         filled: true,
            //         fillColor: Color.fromARGB(255, 228, 224, 224),
            //         hintText: "Login",
            //         hintStyle: TextStyle(
            //           fontSize: 30,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.black,
            //         ),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(60),
            //           borderSide: BorderSide.none,
            //         )),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => const LoginScreen()),
            //       );
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            // SizedBox(
            //   width: 350,
            //   child: TextField(
            //     textAlign: TextAlign.center,
            //     decoration: InputDecoration(
            //         filled: true,
            //         fillColor: Color.fromARGB(255, 228, 224, 224),
            //         hintText: "SignUp",
            //         hintStyle: TextStyle(
            //           fontSize: 30,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.black,
            //         ),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(60),
            //           borderSide: BorderSide.none,
            //         )),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => const SignUpScreen()),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
