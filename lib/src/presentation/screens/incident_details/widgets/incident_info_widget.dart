import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/core/utils/date/date_helper.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:elm_task/src/presentation/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class IncidentInfoWidget extends StatelessWidget {
  final Incident incident;

  const IncidentInfoWidget({
    super.key,
    required this.incident,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemWidget(
          title: S.of(context).status,
          value: _getStatusDescription(
            context,
            incident.status,
          ),
        ),
        const SizedBox(height: 16,),
        ItemWidget(
          title: S.of(context).priority,
          value: incident.priority.toString(),
        ),
        const SizedBox(height: 16,),

        ItemWidget(
          title: S.of(context).type,
          value: incident.typeId.toString(),
        ),
        const SizedBox(height: 16,),

        ItemWidget(
          title: S.of(context).issuerID,
          value: incident.issuerId,
        ),
        const SizedBox(height: 16,),

        ItemWidget(
          title: S.of(context).assigneeID,
          value : incident.assigneeId.isNotEmpty
              ? incident.assigneeId
              : S.of(context).notAssigned,
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
        const SizedBox(height: 16,),
      ],
    );
  }

  String _getStatusDescription(BuildContext context, int status) {
    switch (status) {
      case 0:
        return S.of(context).submitted;
      case 1:
        return S.of(context).inProgress;
      case 2:
        return S.of(context).completed;
      case 3:
        return S.of(context).rejected;
      default:
        return S.of(context).unknown;
    }
  }

}
