import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:elm_task/src/domain/repositories/incidents_repository.dart';

class ChangeIncidentStatusUseCase {
  final IncidentsRepository _incidentsRepository;

  ChangeIncidentStatusUseCase(this._incidentsRepository);

  Future<DataState<Incident>> call(
    String incidentId,
    int status,
  ) async {
    return await _incidentsRepository.changeIncidentStatus(
      incidentId,
      status,
    );
  }
}
