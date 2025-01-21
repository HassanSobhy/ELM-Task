import 'package:elm_task/src/domain/entity/incidents/dashboard.dart';
import 'package:elm_task/src/presentation/screens/dashboard/widgets/summary_item_widget.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final List<Dashboard> dashboardData;

  const SummaryWidget({
    super.key,
    required this.dashboardData,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return SummaryItemWidget(
            dashboard: dashboardData[index],
          );
        },
        itemCount: dashboardData.length,
      ),
    );
  }
}
