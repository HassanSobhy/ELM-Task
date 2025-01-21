part of 'incidents_bloc.dart';

sealed class IncidentsEvent extends Equatable {
  const IncidentsEvent();

  @override
  List<Object> get props => [];
}

final class GetIncidentsEvent extends IncidentsEvent {
  const GetIncidentsEvent();
}

final class GetIncidentTypesEvent extends IncidentsEvent {
  const GetIncidentTypesEvent();
}

final class FilterIncidentByStatusAndDateEvent extends IncidentsEvent {
  final List<Incident> allIncidents;
  final Status status;

  const FilterIncidentByStatusAndDateEvent({
    required this.allIncidents,
    required this.status,
  });

  @override
  List<Object> get props => [
        allIncidents,
        status,
      ];
}

final class LogoutEvent extends IncidentsEvent {
  const LogoutEvent();
}
