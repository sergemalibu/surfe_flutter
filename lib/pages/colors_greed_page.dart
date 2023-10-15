import "package:flutter/material.dart";
import 'package:surf_flutter_courses_template/data/colors_data.dart';
import 'package:surf_flutter_courses_template/pages/detail_colors_page.dart';
import 'package:flutter/services.dart';

class ColorGrid extends StatefulWidget {
  const ColorGrid({super.key});

  static const String _value = 'value';
  static const String _colors = 'colors';
  static const String _title = 'Эксклюзивная палитра «Colored Box»';
  static const String _fontFamily = 'Ubuntu';
  static const String _name = 'name';
  static const String _unknown = 'Unknown';
  static const String _copy = 'HEX скопирован';

  @override
  State<ColorGrid> createState() => _ColorGridState();
}

class _ColorGridState extends State<ColorGrid> {
  final _colorsData = ColorsData();
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //фильтрация
    final filteredColors = _colorsData.colors[ColorGrid._colors]
        ?.where((color) => color[ColorGrid._value] != null)
        .toList();
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const Column(
                  children: [
                    SizedBox(height: 60),
                    Text(
                      ColorGrid._title,
                      style: TextStyle(
                          fontFamily: ColorGrid._fontFamily,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 190,
                      crossAxisCount: 3,
                      crossAxisSpacing: 25,
                    ),
                    itemCount: filteredColors?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var color = filteredColors?[index];
                      var colorName = color?[ColorGrid._name];
                      var colorValue = color?[ColorGrid._value];
                      //преобразование строкового представления цвета
                      Color actualColor = Color(
                          int.parse(colorValue!.substring(1, 7), radix: 16) +
                              0xFF000000);

                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailColors(
                              actualColor: actualColor,
                              colorName: colorName,
                              colorValue: colorValue,
                              copyHex: ColorGrid._copy,
                            ),
                          ),
                        ),
                        onLongPress: () {
                          Clipboard.setData(ClipboardData(text: colorValue));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            width: 173,
                            behavior: SnackBarBehavior.floating,
                            content: Container(
                              height: 34,
                              alignment: Alignment.center,
                              child: const Text(ColorGrid._copy),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ));
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: actualColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                colorName ?? ColorGrid._unknown,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                colorValue,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
