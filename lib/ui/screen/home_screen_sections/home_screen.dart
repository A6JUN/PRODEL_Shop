import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/dashboard_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/product_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/order_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/shop_info_screen.dart';
import 'package:prodel_shop/ui/screen/login_screen.dart';
import 'package:prodel_shop/ui/widgets/custom_alert_dialog.dart';
import 'package:prodel_shop/values/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    Future.delayed(
      const Duration(
        milliseconds: 100,
      ),
      () {
        if (Supabase.instance.client.auth.currentUser == null) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => true,
          );
        }
      },
    );

    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: primaryColor),
        centerTitle: true,
        title: Text(
          'PRODEL SHOP',
          style: GoogleFonts.cambay(
            textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          DashboardScreen(),
          OrderScreen(),
          ProductScreen(),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFE6E3F9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'PRODEL',
                style: GoogleFonts.cambay(
                  textStyle:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DashboardItem(
                icon: Icons.dashboard_outlined,
                label: 'Dashboard',
                isSelected: controller!.index == 0,
                onTap: () {
                  controller!.animateTo(0);
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DashboardItem(
                icon: Icons.local_shipping_outlined,
                label: 'Orders',
                isSelected: controller!.index == 1,
                onTap: () {
                  controller!.animateTo(1);
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DashboardItem(
                icon: Icons.shopping_bag_outlined,
                label: 'Products',
                isSelected: controller!.index == 2,
                onTap: () {
                  controller!.animateTo(2);
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DashboardItem(
                icon: Icons.exit_to_app_outlined,
                label: 'Logout',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => CustomAlertDialog(
                      title: 'Are you sure ?',
                      message: 'Are you sure that you want to logout ?',
                      primaryButtonLabel: 'Logout',
                      primaryOnPressed: () async {
                        await Supabase.instance.client.auth.signOut();

                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => true,
                        );
                      },
                      secondaryButtonLabel: 'Cancel',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function() onTap;
  const DashboardItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: isSelected ? const Color(0xFFB5B8FF) : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                label,
                style: GoogleFonts.cambay(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
