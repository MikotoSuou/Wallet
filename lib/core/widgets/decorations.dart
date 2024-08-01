
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../res/colors.dart';
import '../../res/values.dart' as values;

class Space extends StatelessWidget {
  const Space({
    super.key,
    this.width = values.Size.s0,
    this.height = values.Size.s0
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    height: height,
  );
}


class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;

  const ShimmerWidget({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.margin
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: ColorManager.lightGrey,
    highlightColor: ColorManager.veryLightGrey,
    child: Container(
      width: width,
      height: height,
      margin: margin,
      decoration: ShapeDecoration(
        color: ColorManager.lightGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(values.Size.s16)),
      ),
    ),
  );
}