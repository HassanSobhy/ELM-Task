import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomGradientButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  final double height;
  final double width;
  final Color textColor;
  final bool isEnable;

  const CustomGradientButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.height = 48,
    this.width = double.infinity,
    this.textColor = ColorsManager.white,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEnable) {
          onTap();
        }
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: isEnable
              ? const LinearGradient(
                  colors: [
                    ColorsManager.primary,
                    ColorsManager.secondary,
                  ],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                )
              : null,
          color: isEnable ? null : ColorsManager.gray,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: textColor,
                ),
          ),
        ),
      ),
    );
  }
}
