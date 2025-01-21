import 'package:elm_task/src/domain/entity/incidents/incident.dart';

class FilterIncidentsByStatusAndDateUseCase {
  const FilterIncidentsByStatusAndDateUseCase();

  List<Incident> call(
    List<Incident> incidents,
    int selectedStatusId,
  ) {
    if (selectedStatusId == -1) {
      return incidents;
    }
    return incidents
        .where((incident) => incident.status == selectedStatusId)
        .toList();
  }
}
