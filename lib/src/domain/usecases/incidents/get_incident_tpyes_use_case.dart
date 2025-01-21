import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_type_credential.dart';
import 'package:elm_task/src/domain/repositories/incidents_repository.dart';

class GetIncidentTypesUseCase {
  final IncidentsRepository _incidentsRepository;

  GetIncidentTypesUseCase(this._incidentsRepository);

  Future<DataState<List<IncidentType>>> call() async {
    return await _incidentsRepository.getIncidentTypes();
  }
}
