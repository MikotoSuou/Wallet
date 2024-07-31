
import 'package:flutter/material.dart';
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
