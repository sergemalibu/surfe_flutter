import 'package:flutter/material.dart';
import '../../res/app_strings.dart';
import '../../res/theme_colors.dart';
import 'show_modal_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return const ShowModalBottomSheetWidget();
              },
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: ThemeColors.buttonBorder),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            AppStrings.logOut,
            style: TextStyle(color: ThemeColors.buttonBorder),
          ),
        ),
      ),
    );
  }
}
