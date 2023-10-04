import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/product_entity.dart';
import 'package:surf_flutter_courses_template/product_screen.dart';

void main() {
  runApp(const MaterialApp(home: ProductScreen()));
}

class AppColors {
  static const mainColor = Color(0xFF67CD00);
  static const backColor = Color(0xFFEEEEEE);
}

class AppString {
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

class Filter {
  final products = dataForStudents;

  void sortProducts(String selectedValue) {
    if (selectedValue == AppString.fromAb) {
      products.sort((a, b) => a.title.compareTo(b.title));
    } else if (selectedValue == AppString.fromBa) {
      products.sort((b, a) => a.title.compareTo(b.title));
    } else if (selectedValue == AppString.priceIncreasingValue) {
      products.sort((a, b) => a.price.compareTo(b.price));
    } else if (selectedValue == AppString.priceDescendingValue) {
      products.sort((b, a) => a.price.compareTo(b.price));
    } else if (selectedValue == AppString.categoryIncreasingValue) {
      products.sort((a, b) => a.category.name.compareTo(b.category.name));
    } else if (selectedValue == AppString.categoryReductionValue) {
      products.sort((b, a) => a.category.name.compareTo(b.category.name));
    }
  }
}
