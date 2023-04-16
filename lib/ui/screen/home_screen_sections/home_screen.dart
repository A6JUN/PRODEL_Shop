import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/product_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/order_screen.dart';
import 'package:prodel_shop/ui/screen/home_screen_sections/shop_info_screen.dart';
import 'package:prodel_shop/values/colors.dart';

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
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'PRODEL Shop',
          style: GoogleFonts.cambay(
            textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w900,
                  color: primaryColor,
                ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.exit_to_app_outlined,
              color: primaryColor,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          OrderScreen(),
          ProductScreen(),
          ShopInfoScreen(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Material(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: NavBarItem(
                    icon: controller!.index == 0
                        ? Icons.local_shipping_rounded
                        : Icons.local_shipping_outlined,
                    label: 'Orders',
                    isSelected: controller!.index == 0,
                    onTap: () {
                      controller!.animateTo(0);
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: NavBarItem(
                    icon: controller!.index == 1
                        ? Icons.inventory_2_rounded
                        : Icons.inventory_2_outlined,
                    label: 'Products',
                    isSelected: controller!.index == 1,
                    onTap: () {
                      controller!.animateTo(1);
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: NavBarItem(
                    icon: controller!.index == 2
                        ? Icons.store
                        : Icons.store_outlined,
                    label: 'Shop',
                    isSelected: controller!.index == 2,
                    onTap: () {
                      controller!.animateTo(2);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;

  final String label;
  final bool isSelected;
  final Function() onTap;
  const NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? primaryColor.withOpacity(0.1) : Colors.white10,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color:
                    isSelected ? primaryColor : primaryColor.withOpacity(0.9),
                size: 25,
              ),
              const SizedBox(
                width: 1,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: isSelected
                          ? primaryColor
                          : primaryColor.withOpacity(0.9),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
