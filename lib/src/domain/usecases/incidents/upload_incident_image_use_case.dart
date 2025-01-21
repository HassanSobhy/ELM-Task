import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:elm_task/src/domain/repositories/incidents_repository.dart';

class UploadIncidentImageUseCase {
  final IncidentsRepository _incidentsRepository;

  UploadIncidentImageUseCase(this._incidentsRepository);

  Future<DataState<String>> call(
    String imagePath,
  ) async {
    return await _incidentsRepository.uploadIncidentImage(
      imagePath,
    );
  }
}
