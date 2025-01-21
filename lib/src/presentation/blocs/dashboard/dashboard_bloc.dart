import 'dart:async';

import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/dashboard.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_dashboard.dart';
import 'package:elm_task/src/domain/usecases/incidents/get_incident_dashboard_use_case.dart';
import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetIncidentDashboardUseCase _getIncidentDashboardUseCase;

  DashboardBloc(
    this._getIncidentDashboardUseCase,
  ) : super(DashboardInitial()) {
    on<DashboardGetDataEvent>(_onDashboardGetDataEvent);
  }

  Future<void> _onDashboardGetDataEvent(
      DashboardGetDataEvent event, Emitter<DashboardState> emit) async {
    emit(ShowLoadingState());
    final DataState<IncidentDashboard> result = await _getIncidentDashboardUseCase();
    IncidentDashboard incidentDashboard = result.data ?? IncidentDashboard();
    List<Dashboard> dashboard = [];

    for(int i = 0; i < incidentDashboard.incidents.length; i++) {
      dashboard.add(Dashboard(
        id: incidentDashboard.incidents[i].status,
        name: Status.fromValue(incidentDashboard.incidents[i].status).name,
        value: incidentDashboard.incidents[i].count.status,
        total: 100,
      ));
    }
    if (result is DataSuccess) {
      emit(DashboardSuccessState(
        dashboardData: dashboard,
      ));
    } else {
      emit(DashboardErrorState(
        message: result.message ?? "",
      ));
    }

    emit(HideLoadingState());
  }
}
