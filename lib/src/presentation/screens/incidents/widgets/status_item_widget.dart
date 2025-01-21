import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:flutter/material.dart';

class StatusItemWidget extends StatelessWidget {
  final Status status;
  final bool isSelected;
  final Function(Status) onTap;

  const StatusItemWidget({
    super.key,
    required this.status,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(status),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? ColorsManager.primary : Colors.grey.withOpacity(0.1),
            width: 1,
          ),
          boxShadow:  [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          status.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
