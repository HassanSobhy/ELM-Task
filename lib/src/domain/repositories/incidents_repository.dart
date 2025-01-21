import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_dashboard.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_type_credential.dart';
import 'package:elm_task/src/domain/entity/incidents/incidents.dart';
import 'package:elm_task/src/domain/entity/incidents/submit_incident_form.dart';

abstract class IncidentsRepository {
  Future<DataState<Incidents>> getIncidents();

  Future<DataState<List<IncidentType>>> getIncidentTypes();

  Future<DataState<Incidents>> submitIncident(SubmitIncidentForm form);

  Future<DataState<Incident>> changeIncidentStatus(
    String id,
    int status,
  );

  Future<DataState<String>> uploadIncidentImage(String imagePath);

  Future<DataState<IncidentDashboard>> getIncidentsDashboard();

}
