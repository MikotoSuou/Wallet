
import 'package:flutter/material.dart';
import 'package:wallet/res/colors.dart';
import 'package:wallet/res/values.dart' as values;

class PrimaryButton extends StatelessWidget {
  final double? width;
  final VoidCallback? onClicked;
  final String text;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;

  const PrimaryButton({
    super.key,
    this.width,
    required this.onClicked,
    required this.text,
    this.icon,
    this.padding,
    this.margin,
    this.backgroundColor = ColorManager.secondary,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    margin: margin,
    child: TextButton.icon(
      icon: icon,
      onPressed: onClicked,
      style: TextButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(values.Size.s16),
        ),
      ),
      label: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    ),
  );
}