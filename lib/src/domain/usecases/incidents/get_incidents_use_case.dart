import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/incidents.dart';
import 'package:elm_task/src/domain/repositories/incidents_repository.dart';

class GetIncidentsUseCase {
  final IncidentsRepository _incidentsRepository;

  GetIncidentsUseCase(this._incidentsRepository);

  Future<DataState<Incidents>> call() async {
    return await _incidentsRepository.getIncidents();
  }
}