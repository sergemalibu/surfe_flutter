import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/bottom_nav_bar.dart';
import 'package:surf_flutter_courses_template/main.dart';
import 'package:surf_flutter_courses_template/product_entity.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new,
            size: 18, color: AppColors.mainColor),
        title: const Column(
          children: [
            Text(
              AppString.chek,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              AppString.data,
              style: TextStyle(
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
      body: const SortingOptions(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class SortingOptions extends StatefulWidget {
  const SortingOptions({super.key});

  @override
  State<SortingOptions> createState() => _SortingOptionsState();
}

class _SortingOptionsState extends State<SortingOptions> {
  bool _isLoading = false;
  bool _isSort = false;
  String _selectedValue = AppString.noSorting;

  //Cортировка продуктов
  void sortProducts(selectedValue) async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1), () {
      Filter().sortProducts(selectedValue);
      setState(() {
        _isSort = true;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppString.shoppingList,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.backColor),
                            child: IconButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      AppString.sorting,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    IconButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        icon: const Icon(
                                                            Icons.close))
                                                  ],
                                                ),
                                                const SizedBox(height: 30),
                                                RadioListTile<String>(
                                                  title: const Text(
                                                      AppString.noSorting),
                                                  value: AppString.noSorting,
                                                  groupValue: _selectedValue,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      _selectedValue = value ??
                                                          AppString.noSorting;
                                                    });
                                                  },
                                                ),
                                                const Divider(),
                                                const Text(AppString.byName),
                                                RadioListTile<String>(
                                                  title: const Text(
                                                      AppString.nameFromAb),
                                                  value: AppString.fromAb,
                                                  groupValue: _selectedValue,
                                                  onChanged: (String? value) {
                                                    _selectedValue = value ??
                                                        AppString.noSorting;
                                                    setState(() {});
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  title: const Text(
                                                      AppString.nameFromBa),
                                                  value: AppString.fromBa,
                                                  groupValue: _selectedValue,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      _selectedValue = value ??
                                                          AppString.noSorting;
                                                    });
                                                  },
                                                ),
                                                const Divider(),
                                                const Text(AppString.byPrice),
                                                RadioListTile<String>(
                                                  title: const Text(AppString
                                                      .priceIncreasing),
                                                  value: AppString
                                                      .priceIncreasingValue,
                                                  groupValue: _selectedValue,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      _selectedValue = value ??
                                                          AppString.noSorting;
                                                    });
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  title: const Text(AppString
                                                      .priceDescending),
                                                  value: AppString
                                                      .priceDescendingValue,
                                                  groupValue: _selectedValue,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      _selectedValue = value ??
                                                          AppString.noSorting;
                                                    });
                                                  },
                                                ),
                                                const Text(AppString.type),
                                                RadioListTile<String>(
                                                  title: const Text(
                                                      AppString.typeAb),
                                                  value: AppString
                                                      .categoryIncreasingValue,
                                                  groupValue: _selectedValue,
                                                  onChanged: (String? value) {
                                                    _selectedValue = value ??
                                                        AppString.noSorting;
                                                    setState(() {});
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  title: const Text(
                                                      AppString.typeBa),
                                                  value: AppString
                                                      .categoryReductionValue,
                                                  groupValue: _selectedValue,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      _selectedValue = value ??
                                                          AppString.noSorting;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                      shape: MaterialStateProperty
                                                          .all<
                                                              RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<
                                                                      Color>(
                                                                  const Color(
                                                                      0xFF67CD00)),
                                                    ),
                                                    onPressed: () {
                                                      sortProducts(
                                                          _selectedValue);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      AppString.ready,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.sort),
                            ),
                          ),
                          Positioned(
                            right: 12,
                            bottom: 12,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _isSort
                                      ? AppColors.mainColor
                                      : AppColors.backColor),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                //список продуктов
                ProductList(
                  selectedValue: _selectedValue,
                ),
              ],
            ),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({required this.selectedValue, super.key});
  final String selectedValue;
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final products = Filter().products;
  final groupedProducts = <Category, List<ProductEntity>>{};

  //Групировка по категориям
  Map<Category, List<ProductEntity>> groupProductsByCategory(
      List<ProductEntity> products) {
    for (final product in products) {
      final category = product.category;
      if (!groupedProducts.containsKey(category)) {
        groupedProducts[category] = [];
      }
      groupedProducts[category]!.add(product);
    }
    return groupedProducts;
  }

  //Форматирование цены
  String formatNumber(int number) {
    var formatter = NumberFormat('#,###', 'ru');
    return formatter.format(number);
  }

  @override
  void initState() {
    groupProductsByCategory(products);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.selectedValue == AppString.categoryIncreasingValue ||
            widget.selectedValue == AppString.categoryReductionValue)
        ? (groupedProducts.entries.isEmpty)
            ? const Center(
                child: Text(AppString.empty),
              )
            : Column(
                children: groupedProducts.entries.map(
                  (entry) {
                    final category = entry.key;
                    final categoryProducts = entry.value;

                    if (widget.selectedValue ==
                        AppString.categoryIncreasingValue) {
                      // Сортировка от А до Я по имени
                      categoryProducts
                          .sort((a, b) => a.title.compareTo(b.title));
                    } else if (widget.selectedValue ==
                        AppString.categoryReductionValue) {
                      // Сортировка от Я до А по имени
                      categoryProducts
                          .sort((a, b) => b.title.compareTo(a.title));
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            category.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: categoryProducts.length,
                          itemBuilder: (context, productIndex) {
                            final product = categoryProducts[productIndex];
                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  product.imageUrl,
                                  width: 68,
                                  height: 68,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(product.title),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(product.amount.toString()),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Text(
                                      formatNumber(product.price),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ).toList(),
              )
        : (products.isEmpty)
            ? const Center(
                child: Text(AppString.empty),
              )
            : Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            products[index].imageUrl,
                            width: 68,
                            height: 68,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(products[index].title),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(products[index].amount.toString()),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                formatNumber(products[index].price),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider()),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppString.yourPurchase,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.valuePproducts,
                        ),
                        Text(
                          AppString.totalCost,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppString.sale),
                        Text(
                          AppString.priceSale,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.total,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          AppString.totalPrice,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
  }
}
