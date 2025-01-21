import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:elm_task/src/domain/entity/incidents/dashboard.dart';
import 'package:flutter/material.dart';

class SummaryItemWidget extends StatelessWidget {
  final Dashboard dashboard;

  const SummaryItemWidget({
    super.key,
    required this.dashboard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.gray.withOpacity(0.4),
              blurRadius: 2,
            )
          ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dashboard.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              dashboard.value.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
