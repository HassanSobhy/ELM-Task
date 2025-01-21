import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:elm_task/src/presentation/screens/incidents/widgets/status_item_widget.dart';
import 'package:flutter/material.dart';

class StatusesWidget extends StatelessWidget {
  final List<Status> statuses;
  final Status selectedStatus;
  final Function(Status) onTap;

  const StatusesWidget({
    super.key,
    required this.statuses,
    required this.selectedStatus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 16,
        children: statuses
            .map(
              (status) => StatusItemWidget(
                status: status,
                isSelected: status == selectedStatus,
                onTap: (status) {
                  onTap(status);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
