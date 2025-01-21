import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_type_credential.dart';
import 'package:elm_task/src/presentation/screens/incidents/widgets/incident_widget.dart';
import 'package:flutter/material.dart';

class IncidentsWidget extends StatelessWidget {
  final List<Incident> incidents;
  final List<IncidentType> incidentTypes;
  final Function(Incident) onTap;

  const IncidentsWidget({
    super.key,
    required this.incidents,
    required this.incidentTypes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: incidents.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemBuilder: (context, index) {
        return IncidentWidget(
          incident: incidents[index],
          incidentTypes: incidentTypes,
          onTap: () {
            onTap(incidents[index]);
          },
        );
      },
    );
  }
}
