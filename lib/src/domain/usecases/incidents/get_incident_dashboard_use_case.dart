import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_dashboard.dart';
import 'package:elm_task/src/domain/repositories/incidents_repository.dart';

class GetIncidentDashboardUseCase {
  final IncidentsRepository _incidentsRepository;

  GetIncidentDashboardUseCase(this._incidentsRepository);

  Future<DataState<IncidentDashboard>> call() async {
    return await _incidentsRepository.getIncidentsDashboard();
  }
}
