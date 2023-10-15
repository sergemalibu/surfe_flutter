import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({required this.schemColor, required this.selectBorder});

  final Color? schemColor;
  final Color? selectBorder;

  @override
  MyColors copyWith({Color? schemColor}) {
    return MyColors(
        schemColor: schemColor ?? this.schemColor,
        selectBorder: selectBorder ?? selectBorder);
  }

  @override
  MyColors lerp(covariant ThemeExtension<ThemeExtension>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
        schemColor: Color.lerp(schemColor, other.schemColor, t),
        selectBorder: Color.lerp(selectBorder, other.selectBorder, t));
  }

  // Optional
  @override
  String toString() => 'MyColors(schemColor: $schemColor, )';
}
