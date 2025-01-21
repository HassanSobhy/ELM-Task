import 'dart:async';

import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_type_credential.dart';
import 'package:elm_task/src/domain/entity/incidents/incidents.dart';
import 'package:elm_task/src/domain/usecases/authentication/delete_token_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/filter_incidents_by_status_and_date_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/get_incident_tpyes_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/get_incidents_use_case.dart';
import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'incidents_event.dart';

part 'incidents_state.dart';

class IncidentsBloc extends Bloc<IncidentsEvent, IncidentsState> {
  final GetIncidentsUseCase _getIncidentsUseCase;
  final GetIncidentTypesUseCase _getIncidentTypesUseCase;
  final FilterIncidentsByStatusAndDateUseCase _filterIncidentsByStatusUseCase;
  final DeleteTokenUseCase _deleteTokenUseCase;

  IncidentsBloc(
    this._getIncidentsUseCase,
    this._getIncidentTypesUseCase,
    this._filterIncidentsByStatusUseCase,
    this._deleteTokenUseCase,
  ) : super(IncidentsInitial()) {
    on<GetIncidentsEvent>(_onGetIncidentsEvent);
    on<FilterIncidentByStatusAndDateEvent>(
        _onFilterIncidentByStatusAndDateEvent);
    on<LogoutEvent>(_onLogoutEvent);

  }

  FutureOr<void> _onGetIncidentsEvent(
    GetIncidentsEvent event,
    Emitter<IncidentsState> emit,
  ) async {
    emit(ShowLoadingState());
    final result = await Future.wait([
      _getIncidentsUseCase(),
      _getIncidentTypesUseCase(),
    ]);

    if (result[0] is DataSuccess && result[1] is DataSuccess) {
      final incidents =
          (result[0] as DataState<Incidents>).data?.incidents ?? [];
      final incidentTypes =
          (result[1] as DataState<List<IncidentType>>).data ?? [];
      emit(GetIncidentsSuccessState(
        incidents: incidents,
        incidentTypes: incidentTypes,
      ));
    } else {
      emit(GetIncidentsFailedState(
        message: result[0].message ?? "",
      ));
    }

    emit(HideLoadingState());
  }

  FutureOr<void> _onFilterIncidentByStatusAndDateEvent(
    FilterIncidentByStatusAndDateEvent event,
    Emitter<IncidentsState> emit,
  ) async {
    emit(ShowLoadingState());
    List<Incident> incidents =
        _filterIncidentsByStatusUseCase(event.allIncidents, event.status.value);
    emit(FilterIncidentByStatusAndDateState(
      incidents: incidents,
      status: event.status,
    ));
    emit(HideLoadingState());
  }

  FutureOr<void> _onLogoutEvent(
    LogoutEvent event,
    Emitter<IncidentsState> emit,
  ) async {
    await _deleteTokenUseCase();
    emit(LogoutState());
  }
}
