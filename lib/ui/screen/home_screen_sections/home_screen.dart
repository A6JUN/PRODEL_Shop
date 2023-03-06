import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/inventory_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/product_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/order_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/settings_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/staff_screen.dart';

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
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 204, 204),
        elevation: 0,
        iconTheme: const IconThemeData(),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: controller,
        children: const [
          InventoryScreen(),
          ProductScreen(),
          OrderScreen(),
          StaffScreen(),
          SettingsScreen(),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'PRODEL',
                style: GoogleFonts.cambay(
                  textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 40),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                child: DashboardItem(
                    icon: Icons.inventory,
                    label: "Inventory",
                    isSelected: controller!.index == 0,
                    onTap: () {
                      controller!.animateTo(0);
                      setState(() {});
                      Navigator.pop(context);
                    })),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: DashboardItem(
                icon: Icons.archive_rounded,
                label: 'Product',
                isSelected: controller!.index == 1,
                onTap: () {
                  controller!.animateTo(1);
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: DashboardItem(
                icon: Icons.production_quantity_limits,
                label: 'Order',
                isSelected: controller!.index == 2,
                onTap: () {
                  controller!.animateTo(2);
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: DashboardItem(
                icon: Icons.people,
                label: 'Staff',
                isSelected: controller!.index == 3,
                onTap: () {
                  controller!.animateTo(3);
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: DashboardItem(
                icon: Icons.settings,
                label: 'Settings',
                isSelected: controller!.index == 4,
                onTap: () {
                  controller!.animateTo(4);
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 30,
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
    return InkWell(
      onTap: onTap,
      child: Material(
        color: isSelected
            ? Color.fromARGB(255, 112, 121, 146)
            : Color.fromARGB(26, 117, 114, 114),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   width: 10,
              //   height: 10,
              //   color: const Color(0xFF5B62FC),
              // ),
              Icon(
                icon,
                color: Color.fromARGB(255, 11, 3, 168),
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                label,
                style: GoogleFonts.cambay(
                  textStyle:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Color.fromARGB(255, 11, 3, 168),
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
