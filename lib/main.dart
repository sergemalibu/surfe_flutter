import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/bottom_nav_bar.dart';
import 'package:surf_flutter_courses_template/product_entity.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _products = dataForStudents;
  String _selectedValue = AppString.noSorting;
  bool _isLoading = false;
  bool _isSort = false;
  var groupedProducts = <Category, List<ProductEntity>>{};

//Cортировка продуктов
  void sortProducts(selectedValue) async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1), () {
      if (selectedValue == AppString.typeAb) {
        _products.sort((a, b) => a.title.compareTo(b.title));
      } else if (selectedValue == AppString.fromBa) {
        _products.sort((b, a) => a.title.compareTo(b.title));
      } else if (selectedValue == AppString.priceIncreasingValue) {
        _products.sort((a, b) => a.price.compareTo(b.price));
      } else if (selectedValue == AppString.priceDescendingValue) {
        _products.sort((b, a) => a.price.compareTo(b.price));
      } else if (selectedValue == AppString.categoryIncreasingValue) {
        _products.sort((a, b) => a.category.name.compareTo(b.category.name));
      } else if (selectedValue == AppString.categoryReductionValue) {
        _products.sort((b, a) => a.category.name.compareTo(b.category.name));
      }
      setState(() {
        _isSort = true;
        _isLoading = false;
      });
    });
  }

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
    groupProductsByCategory(_products);
    super.initState();
  }

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
                (_selectedValue == AppString.categoryIncreasingValue ||
                        _selectedValue == AppString.categoryReductionValue)
                    ? (groupedProducts.entries.isEmpty)
                        ? const Center(
                            child: Text(AppString.empty),
                          )
                        : Column(
                            children: groupedProducts.entries.map((entry) {
                              final category = entry.key;
                              final categoryProducts = entry.value;

                              if (_selectedValue ==
                                  AppString.categoryIncreasingValue) {
                                // Сортировка от А до Я по имени
                                categoryProducts
                                    .sort((a, b) => a.title.compareTo(b.title));
                              } else if (_selectedValue ==
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
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: categoryProducts.length,
                                    itemBuilder: (context, productIndex) {
                                      final product =
                                          categoryProducts[productIndex];
                                      return ListTile(
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                              padding: const EdgeInsets.only(
                                                  right: 30),
                                              child: Text(
                                                formatNumber(product.price),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            }).toList(),
                          )
                    : (_products.isEmpty)
                        ? const Center(
                            child: Text(AppString.empty),
                          )
                        : Column(
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _products.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        _products[index].imageUrl,
                                        width: 68,
                                        height: 68,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(_products[index].title),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            _products[index].amount.toString()),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            formatNumber(
                                                _products[index].price),
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppString.total,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      AppString.totalPrice,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
              ],
            ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

abstract class AppColors {
  static const mainColor = Color(0xFF67CD00);
  static const backColor = Color(0xFFEEEEEE);
}

abstract class AppString {
  static const chek = 'Чек № 56';
  static const data = '24.02.23 в 12:23';
  static const shoppingList = 'Список покупок';
  static const yourPurchase = 'В вашей покупке';
  static const valuePproducts = '10 товаров';
  static const totalCost = '7 842 руб';
  static const sale = 'скидка 5 %';
  static const priceSale = '-300 руб';
  static const total = 'Итого';
  static const totalPrice = '7 542 руб';
  static const sorting = 'Сортировка';
  static const noSorting = 'Без сортировки';
  static const byName = 'По имени';
  static const nameFromAb = 'По имени от А до Я';
  static const fromAb = 'от А до Я';
  static const nameFromBa = 'По имени от Я до А';
  static const fromBa = 'от Я до А';
  static const byPrice = 'По цене ';
  static const priceIncreasing = 'По цене (возрастание)';
  static const priceIncreasingValue = 'priceIncrease';
  static const priceDescending = 'По цене (убывание)';
  static const priceDescendingValue = 'priceReduction';
  static const type = 'По типу ';
  static const typeAb = 'По типу от А до Я';
  static const categoryIncreasingValue = 'categoryIncrease';
  static const typeBa = 'По типу от Я до А';
  static const categoryReductionValue = 'categoryReduction';
  static const ready = 'Готово';
  static const empty = 'Здесь пока ничего нет';
}
