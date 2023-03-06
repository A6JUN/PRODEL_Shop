import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/home_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/signup_screen.dart';
import 'package:prodel_shop/ui/screen/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Material(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 228, 224, 224),
                    hintText: "Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Material(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 228, 224, 224),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              onTap: () {},
              label: 'Login',
            ),
            // SizedBox(
            //   width: 180,
            //   child: TextField(
            //     textAlign: TextAlign.center,
            //     decoration: InputDecoration(
            //         filled: true,
            //         fillColor: Color.fromARGB(255, 228, 224, 224),
            //         hintText: "Login",
            //         hintStyle: TextStyle(
            //           fontSize: 20,
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
            //         MaterialPageRoute(builder: (context) => const HomeScreen()),
            //       );
            //     },
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),

            RichText(
              text: TextSpan(
                text: 'Dont have an account?',
                children: [
                  TextSpan(
                    text: ' Sign up',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
