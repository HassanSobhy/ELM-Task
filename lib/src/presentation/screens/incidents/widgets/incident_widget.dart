import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/core/utils/date/date_helper.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_type_credential.dart';
import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:elm_task/src/presentation/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class IncidentWidget extends StatelessWidget {
  final Incident incident;
  final List<IncidentType> incidentTypes;
  final Function() onTap;

  const IncidentWidget({
    super.key,
    required this.incident,
    required this.incidentTypes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.2), width: 0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    incident.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Status.fromValue(incident.status).color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    Status.fromValue(incident.status).description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ItemWidget(
              title: S.of(context).type,
              value: incidentTypes
                  .firstWhere(
                    (element) => element.id == incident.typeId,
                    orElse: () => const IncidentType(id: 0, englishName: 'Unknown'),
                  )
                  .englishName,
            ),
            const SizedBox(height: 16,),
            ItemWidget(
              title: S.of(context).priority,
              value: "${incident.priority}",
            ),

            const SizedBox(height: 16,),
            ItemWidget(
              title: S.of(context).createdAt,
              value: formatDate(incident.createdAt),
            ),
            const SizedBox(height: 16,),
            ItemWidget(
              title: S.of(context).updatedAt,
              value: formatDate(incident.updatedAt),
            ),
          ],
        ),
      ),
    );
  }
}
