import 'package:flutter/material.dart';
import 'package:prodel_shop/ui/widgets/custom_action_button.dart';
import 'package:prodel_shop/ui/widgets/custom_search.dart';
import 'package:prodel_shop/values/colors.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomSearch(
              onSearch: (search) {},
            ),
            const SizedBox(
              height: 10,
            ),
            CustomActionButton(
              onPressed: () {},
              label: 'Add Product',
              color: primaryColor,
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

// class ProductTabItem extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final Function() onTap;
//   const ProductTabItem(
//       {super.key,
//       required this.label,
//       required this.isSelected,
//       required this.onTap,
//       required});

//   @override
//   Widget build(BuildContext context) {
//     return IntrinsicWidth(
//       child: InkWell(
//         borderRadius: BorderRadius.circular(10),
//         onTap: onTap,
//         child: Material(
//           color: Colors.transparent,
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 Text(
//                   label,
//                   style: Theme.of(context).textTheme.labelLarge!.copyWith(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w700,
//                       ),
//                 ),
//                 SizedBox(
//                   height: isSelected ? 5 : 0,
//                 ),
//                 isSelected
//                     ? Container(
//                         height: 5,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(
//                             20,
//                           ),
//                         ),
//                       )
//                     : const SizedBox(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
