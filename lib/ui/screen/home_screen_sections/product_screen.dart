import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodel_shop/blocs/product/product_bloc.dart';
import 'package:prodel_shop/ui/screen/product_screen_sections/product_images.dart';
import 'package:prodel_shop/ui/widgets/category_selector.dart';
import 'package:prodel_shop/ui/widgets/custom_action_button.dart';
import 'package:prodel_shop/ui/widgets/custom_alert_dialog.dart';
import 'package:prodel_shop/ui/widgets/custom_icon_button.dart';
import 'package:prodel_shop/ui/widgets/custom_search.dart';
import 'package:prodel_shop/ui/widgets/products/add_edit_product_dialog.dart';
import 'package:prodel_shop/ui/widgets/products/update_stock_dialog.dart';
import 'package:prodel_shop/values/colors.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductBloc productBloc = ProductBloc();
  bool isExpanded = false;
  int? categoryId;

  @override
  void initState() {
    productBloc.add(GetAllProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>.value(
      value: productBloc,
      child: Center(
        child: SizedBox(
          width: 1000,
          child: BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state is ProductFailureState) {
                showDialog(
                  context: context,
                  builder: (_) => CustomAlertDialog(
                    message: state.message,
                    title: 'Failure',
                    primaryButtonLabel: 'Ok',
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Products',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomActionButton(
                            color: primaryColor,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (builde) =>
                                    BlocProvider<ProductBloc>.value(
                                  value: productBloc,
                                  child: const AddEditProductDialog(),
                                ),
                              );
                            },
                            label: 'Add Product',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: isExpanded ? 20 : 10,
                  ),
                  isExpanded
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: CustomSearch(
                                onSearch: (search) {
                                  productBloc.add(
                                    GetAllProductsEvent(
                                      query: search,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CategorySelector(
                              onSelect: (id) {
                                productBloc.add(
                                  GetAllProductsEvent(
                                    categoryId: categoryId =
                                        id == 0 ? null : id,
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      : const SizedBox(),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 165, 163, 163),
                    height: 30,
                  ),
                  state is ProductLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : state is ProductSuccessState
                          ? state.products.isNotEmpty
                              ? Expanded(
                                  child: DataTable2(
                                    columnSpacing: 9,
                                    horizontalMargin: 9,
                                    dataRowHeight: 100,
                                    columns: [
                                      DataColumn2(
                                        size: ColumnSize.S,
                                        label: Text(
                                          "#ID",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      DataColumn2(
                                        size: ColumnSize.L,
                                        label: Text(
                                          "Name",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      DataColumn2(
                                        size: ColumnSize.L,
                                        label: Text(
                                          "Description",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      DataColumn2(
                                        size: ColumnSize.M,
                                        label: Text(
                                          "Category",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      DataColumn2(
                                        size: ColumnSize.M,
                                        label: Text(
                                          "Price",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      DataColumn2(
                                        size: ColumnSize.M,
                                        label: Text(
                                          "Disc.Price",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      DataColumn2(
                                        size: ColumnSize.M,
                                        label: Text(
                                          "Measure.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      DataColumn2(
                                        size: ColumnSize.M,
                                        label: Text(
                                          "Qty",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      DataColumn2(
                                        size: ColumnSize.M,
                                        label: Text(
                                          "Stock",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      DataColumn2(
                                        size: ColumnSize.L,
                                        label: Text(
                                          "Actions",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(
                                      state.products.length,
                                      (index) => DataRow(
                                        cells: [
                                          DataCell(
                                            Text(
                                              state.products[index]['id']
                                                  .toString(),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              state.products[index]['name'],
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              state.products[index]
                                                  ['description'],
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              state.products[index]['category']
                                                  ['name'],
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              '₹${state.products[index]['price'].toString()}',
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              '₹${state.products[index]['discounted_price'].toString()}',
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              state.products[index]
                                                  ['measurement'],
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              state.products[index]['quantity']
                                                  .toString(),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              state.products[index]['stock']
                                                  .toString(),
                                            ),
                                          ),
                                          DataCell(
                                            Wrap(
                                              runSpacing: 10,
                                              spacing: 10,
                                              children: [
                                                CustomIconButton(
                                                  iconData:
                                                      Icons.add_box_outlined,
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          BlocProvider<
                                                              ProductBloc>.value(
                                                        value: productBloc,
                                                        child:
                                                            UpdateStockDialog(
                                                          productDetails: state
                                                              .products[index],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  color: Colors.purple,
                                                ),
                                                CustomIconButton(
                                                  iconData:
                                                      Icons.image_outlined,
                                                  onPressed: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) =>
                                                            ProductImagesScreen(
                                                          images: state
                                                                  .products[
                                                              index]['images'],
                                                          productId:
                                                              state.products[
                                                                  index]['id'],
                                                        ),
                                                      ),
                                                    );

                                                    productBloc.add(
                                                        GetAllProductsEvent());
                                                  },
                                                ),
                                                CustomIconButton(
                                                  iconData: Icons.edit_outlined,
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          BlocProvider<
                                                              ProductBloc>.value(
                                                        value: productBloc,
                                                        child:
                                                            AddEditProductDialog(
                                                          productDetails: state
                                                              .products[index],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  color: Colors.orange,
                                                ),
                                                CustomIconButton(
                                                  iconData: Icons
                                                      .delete_forever_outlined,
                                                  onPressed: () {
                                                    productBloc.add(
                                                      DeleteProductEvent(
                                                        productId: state
                                                                .products[index]
                                                            ['id'],
                                                      ),
                                                    );
                                                  },
                                                  color: Colors.red,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const Center(child: Text('No products found !'))
                          : state is ProductFailureState
                              ? Center(
                                  child: CustomActionButton(
                                    onPressed: () {
                                      productBloc.add(GetAllProductsEvent());
                                    },
                                    label: 'Retry',
                                    iconData: Icons.refresh_outlined,
                                    mainAxisSize: MainAxisSize.min,
                                  ),
                                )
                              : const SizedBox(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              );
            },
          ),
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
