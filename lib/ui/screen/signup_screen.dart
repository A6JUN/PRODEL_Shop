import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/home_screen.dart';
import 'package:prodel_shop/ui/screen/login_screen.dart';
import 'package:prodel_shop/ui/screen/widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 350,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Material(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter Your Name';
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.contacts_outlined,
                          color: Colors.black,
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Material(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                        hintText: "Email Address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Material(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          value.trim().length < 8) {
                        return "enter password";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.black,
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Material(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.black,
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account?',
                    children: [
                      TextSpan(
                        text: ' Login',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 720),
                //       child: Row(
                //         children: [
                //           Text('Already have an account?. '),
                //           Text.rich(TextSpan(
                //               style: TextStyle(
                //                 fontSize: 27,
                //               ),
                //               children: [
                //                 TextSpan(
                //                     style:
                //                         TextStyle(color: Colors.blue, fontSize: 18),
                //                     text: "login",
                //                     recognizer: TapGestureRecognizer()
                //                       ..onTap = () async {
                //                         Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                               builder: (context) =>
                //                                   const LoginScreen()),
                //                         );
                //                       }),

                //                 //more text paragraph, sentences here.
                //               ])),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: 150,
                  child: CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      }
                    },
                    label: 'SignUp',
                  ),
                )
                // SizedBox(
                //   width: 180,
                //   child: TextField(
                //     textAlign: TextAlign.center,
                //     decoration: InputDecoration(
                //         filled: true,
                //         fillColor: Color.fromARGB(255, 228, 224, 224),
                //         hintText: "SignUp",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
