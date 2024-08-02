
import 'package:flutter/material.dart';
import 'package:wallet/core/utils/extensions/double_ext.dart';
import 'package:wallet/core/widgets/decorations.dart';
import 'package:wallet/res/colors.dart';
import 'package:wallet/res/strings.dart';
import 'package:wallet/res/values.dart' as values;

import '../../domain/entities/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsList({
    super.key,
    required this.transactions
  });

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: values.Size.s16),
      separatorBuilder: (context, index) => const Divider(color: ColorManager.lightGrey, thickness: 2),
      itemCount: transactions.length,
      itemBuilder: (context, index) => Column(
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
                "${transactions[index].date} - ${transactions[index].time}",
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
                "-${transactions[index].amount.toStringAmount}",
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
