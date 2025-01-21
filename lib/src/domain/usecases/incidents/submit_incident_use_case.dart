import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/incidents.dart';
import 'package:elm_task/src/domain/entity/incidents/submit_incident_form.dart';
import 'package:elm_task/src/domain/repositories/incidents_repository.dart';

class SubmitIncidentUseCase {
  final IncidentsRepository _incidentsRepository;

  SubmitIncidentUseCase(this._incidentsRepository);

  Future<DataState<Incidents>> call(SubmitIncidentForm form) async {
    return await _incidentsRepository.submitIncident(form);
  }
}