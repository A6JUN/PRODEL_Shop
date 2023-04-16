import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/home_screen.dart';
import 'package:prodel_shop/ui/screen/login_screen.dart';
import 'package:prodel_shop/ui/widgets/custom_progress_indicator.dart';
import 'package:prodel_shop/values/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        if (Supabase.instance.client.auth.currentUser != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'PRODEL',
                style: GoogleFonts.cambay(
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        color: primaryColor,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
