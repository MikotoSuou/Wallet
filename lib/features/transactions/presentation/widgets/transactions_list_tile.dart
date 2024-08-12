
import 'package:flutter/material.dart';
import 'package:wallet/core/utils/extensions/double_ext.dart';
import 'package:wallet/core/widgets/decorations.dart';
import 'package:wallet/res/strings.dart';
import 'package:wallet/res/values.dart' as values;

import '../../../../res/colors.dart';
import '../../domain/entities/transaction.dart';

class TransactionDate extends StatelessWidget {
  final String date;

  const TransactionDate({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      date,
      style: Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
    ),
  );
}


class TransactionDateWithDivider extends StatelessWidget {
  final String date;

  const TransactionDateWithDivider({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Divider(color: ColorManager.lightGrey, thickness: 2),

      const Space(height: values.Size.s10),

      Text(
        date,
        style: Theme.of(context).textTheme.titleSmall,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}


class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Strings.debitFrom,
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
          ),

          const Space(width: values.Size.s10),

          Text(
            transaction.time,
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Strings.wallet,
            style: Theme.of(context).textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),

          const Space(width: values.Size.s10),

          Text(
            transaction.amount.toStringAmount,
            style: Theme.of(context).textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),

      const Space(height: values.Size.s10),
    ],
  );
}
