import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:elm_task/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:flutter/material.dart';

class ChangeStatusWidget extends StatelessWidget {
  final Status selectedStatus;
  final Function(Status) onSelectedStatus;
  final Function(Status) onUpdateStatus;

  const ChangeStatusWidget({
    super.key,
    required this.selectedStatus,
    required this.onSelectedStatus,
    required this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).selectStatus,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButton<int>(
          value: selectedStatus.value,
          isExpanded: true,
          items: [
            DropdownMenuItem(value: 0, child: Text(S.of(context).submitted)),
            DropdownMenuItem(value: 1, child: Text(S.of(context).inProgress)),
            DropdownMenuItem(value: 2, child: Text(S.of(context).completed)),
            DropdownMenuItem(value: 3, child: Text(S.of(context).rejected)),
          ],
          onChanged: (value) {
            if (value != null) {
              onSelectedStatus(Status.fromValue(value));
            }
          },
        ),
        const SizedBox(height: 16),
        CustomGradientButtonWidget(
          text: S.of(context).updateStatus,
          onTap: () {
            onUpdateStatus(selectedStatus);
          },
        )
      ],
    );
  }
}
