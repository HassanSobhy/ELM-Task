part of 'incidents_bloc.dart';

sealed class IncidentsState extends Equatable {
  const IncidentsState();

  @override
  List<Object> get props => [];
}

final class IncidentsInitial extends IncidentsState {}

final class ShowLoadingState extends IncidentsState {}

final class HideLoadingState extends IncidentsState {}

final class GetIncidentsSuccessState extends IncidentsState {
  final List<Incident> incidents;
  final List<IncidentType> incidentTypes;

  const GetIncidentsSuccessState({
    required this.incidents,
    required this.incidentTypes,
  });

  @override
  List<Object> get props => [
        incidents,
    incidentTypes,
      ];
}

final class GetIncidentsFailedState extends IncidentsState {
  final String message;

  const GetIncidentsFailedState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

final class GetIncidentTypesSuccessState extends IncidentsState {
  final List<IncidentType> incidentTypes;

  const GetIncidentTypesSuccessState({
    required this.incidentTypes,
  });

  @override
  List<Object> get props => [
        incidentTypes,
      ];
}

final class GetIncidentTypesFailedState extends IncidentsState {
  final String message;

  const GetIncidentTypesFailedState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

final class FilterIncidentByStatusAndDateState extends IncidentsState {
  final Status status;
  final List<Incident> incidents;

  const FilterIncidentByStatusAndDateState({
    required this.status,
    required this.incidents,
  });

  @override
  List<Object> get props => [
        status,
        incidents,
      ];
}

final class LogoutState extends IncidentsState {}