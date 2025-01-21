import 'package:bloc/bloc.dart';
import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:elm_task/src/domain/usecases/incidents/change_incident_status_use_case.dart';
import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:equatable/equatable.dart';

part 'incident_details_state.dart';

class IncidentDetailsCubit extends Cubit<IncidentDetailsState> {
  final ChangeIncidentStatusUseCase _changeIncidentStatusUseCase;

  IncidentDetailsCubit(
    this._changeIncidentStatusUseCase,
  ) : super(IncidentDetailsInitial());

  void selectStatus(Status status) {
    emit(SelectIncidentStatus(status: status));
  }

  Future<void> changeIncidentStatus({
    required String incidentId,
    required int statusId,
  }) async {
    emit(ShowLoadingState());
    final result = await _changeIncidentStatusUseCase(incidentId, statusId);

    if (result is DataSuccess) {
      emit(ChangeIncidentStatusSuccessState(
        incident: result.data ?? Incident(),
        message: result.message ?? "",
      ));
    } else {
      emit(ChangeIncidentStatusErrorState(
        message: result.message ?? "",
      ));
    }
    emit(HideLoadingState());
  }
}
