import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/res/app_strings.dart';
import 'package:surf_flutter_courses_template/theme/my_theme_color.dart';
import 'package:surf_flutter_courses_template/theme/theme_provider.dart';

class ShowModalBottomSheetWidget extends StatefulWidget {
  const ShowModalBottomSheetWidget({super.key});

  @override
  State<ShowModalBottomSheetWidget> createState() =>
      _ShowModalBottomSheetWidgetState();
}

class _ShowModalBottomSheetWidgetState
    extends State<ShowModalBottomSheetWidget> {
  String _selectedValueTheme = AppStrings.systemThem;
  int _selectedColorScheme = 1;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      child: Container(
        color: themeProvider.themeData.dialogBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      AppStrings.themeDesign,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close))
                  ],
                ),
                const SizedBox(height: 10),
                RadioListTile<String>(
                  title: const Text(AppStrings.systemThem),
                  value: AppStrings.systemThem,
                  groupValue: _selectedValueTheme,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValueTheme = value ?? AppStrings.systemThem;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 10),
                RadioListTile<String>(
                  title: const Text(AppStrings.systemThemLite),
                  value: AppStrings.systemThemLite,
                  groupValue: _selectedValueTheme,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValueTheme = value ?? AppStrings.systemThem;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
                _selectedValueTheme == AppStrings.systemThemLite
                    ? const ColorSchemeWidget()
                    : const SizedBox(),
                const SizedBox(height: 10),
                RadioListTile<String>(
                  title: const Text(AppStrings.systemThemDark),
                  value: AppStrings.systemThemDark,
                  groupValue: _selectedValueTheme,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValueTheme = value ?? AppStrings.systemThem;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
                _selectedValueTheme == AppStrings.systemThemDark
                    ? const ColorSchemeWidget()
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      themeProvider.toggleTheme(
                          _selectedColorScheme, _selectedValueTheme);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      AppStrings.ready,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
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

class ColorSchemeWidget extends StatefulWidget {
  const ColorSchemeWidget({super.key});

  @override
  State<ColorSchemeWidget> createState() => _ColorSchemeWidgetState();
}

class _ColorSchemeWidgetState extends State<ColorSchemeWidget> {
  bool _isContainer1Selected = false;
  bool _isContainer2Selected = false;
  bool _isContainer3Selected = false;

  void _toggleSelection(int containerNumber) {
    context
        .findAncestorStateOfType<_ShowModalBottomSheetWidgetState>()
        ?._selectedColorScheme = containerNumber;
    setState(() {
      if (containerNumber == 1) {
        _isContainer1Selected = !_isContainer1Selected;
        _isContainer2Selected = false;
        _isContainer3Selected = false;
      } else if (containerNumber == 2) {
        _isContainer2Selected = !_isContainer2Selected;
        _isContainer1Selected = false;
        _isContainer3Selected = false;
      } else if (containerNumber == 3) {
        _isContainer3Selected = !_isContainer3Selected;
        _isContainer1Selected = false;
        _isContainer2Selected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Освещенность темы
    Brightness themeBrightness = Theme.of(context).brightness;

    // Цвет текста в зависимости от освещенности темы
    Color textColor =
        themeBrightness == Brightness.light ? Colors.black : Colors.white;
    final schemColor = Theme.of(context).extension<MyColors>()?.schemColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.colorScheeme,
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (() => _toggleSelection(1)),
                child: Container(
                  height: 64,
                  decoration: BoxDecoration(
                    border: _isContainer1Selected
                        ? Border.all(color: Theme.of(context).primaryColor)
                        : null,
                    borderRadius: BorderRadius.circular(6),
                    color: schemColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppStrings.colorScheemeIcon1,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        AppStrings.colorScheeme1,
                        style: TextStyle(
                          color: _isContainer1Selected
                              ? textColor
                              : Theme.of(context).hintColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _toggleSelection(2);
                },
                child: Container(
                  height: 64,
                  decoration: BoxDecoration(
                    border: _isContainer2Selected
                        ? Border.all(color: Theme.of(context).primaryColor)
                        : null,
                    borderRadius: BorderRadius.circular(6),
                    color: schemColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppStrings.colorScheemeIcon2,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        AppStrings.colorScheeme2,
                        style: TextStyle(
                          color: _isContainer2Selected
                              ? textColor
                              : Theme.of(context).hintColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: (() => {
                      _toggleSelection(3),
                    }),
                child: Container(
                  height: 64,
                  decoration: BoxDecoration(
                    border: _isContainer3Selected
                        ? Border.all(color: Theme.of(context).primaryColor)
                        : null,
                    borderRadius: BorderRadius.circular(6),
                    color: schemColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppStrings.colorScheemeIcon3,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        AppStrings.colorScheeme3,
                        style: TextStyle(
                          color: _isContainer3Selected
                              ? textColor
                              : Theme.of(context).hintColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
