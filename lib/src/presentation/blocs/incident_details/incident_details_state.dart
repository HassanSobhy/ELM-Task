part of 'incident_details_cubit.dart';

sealed class IncidentDetailsState extends Equatable {
  const IncidentDetailsState();

  @override
  List<Object> get props => [];
}

final class IncidentDetailsInitial extends IncidentDetailsState {}

final class ShowLoadingState extends IncidentDetailsState {}

final class HideLoadingState extends IncidentDetailsState {}

final class SelectIncidentStatus extends IncidentDetailsState {
  final Status status;

  const SelectIncidentStatus({
    required this.status,
  });

  @override
  List<Object> get props => [
        status,
      ];
}

final class ChangeIncidentStatusSuccessState extends IncidentDetailsState {
  final Incident incident;
  final String message;

  const ChangeIncidentStatusSuccessState({
    required this.incident,
    required this.message,
  });

  @override
  List<Object> get props => [incident];
}

final class ChangeIncidentStatusErrorState extends IncidentDetailsState {
  final String message;

  const ChangeIncidentStatusErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
