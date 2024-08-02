
import 'package:flutter/material.dart';
import 'package:wallet/core/widgets/decorations.dart';
import 'package:wallet/res/values.dart' as values;

class TransactionsLoading extends StatelessWidget {
  const TransactionsLoading({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: values.Size.s16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShimmerWidget(
          height: values.Size.s16,
        ),

        const Space(height: values.Size.s10),

        ShimmerWidget(
          width: MediaQuery.sizeOf(context).width * 0.5,
          height: values.Size.s12,
        ),

        const Space(height: values.Size.s10),

        ShimmerWidget(
          width: MediaQuery.sizeOf(context).width * 0.25,
          height: values.Size.s10,
        ),
      ],
    ),
  );
}
