part of 'add_incident_bloc.dart';

sealed class AddIncidentState extends Equatable {
  const AddIncidentState();

  @override
  List<Object> get props => [];
}

final class AddIncidentInitial extends AddIncidentState {}

final class ShowLoadingState extends AddIncidentState {}

final class HideLoadingState extends AddIncidentState {}

final class GetIncidentTypesSuccessState extends AddIncidentState {
  final List<IncidentType> incidentTypes;

  const GetIncidentTypesSuccessState({
    required this.incidentTypes,
  });

  @override
  List<Object> get props => [
        incidentTypes,
      ];
}

final class GetIncidentTypesErrorState extends AddIncidentState {
  final String message;

  const GetIncidentTypesErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

final class SelectIncidentStatus extends AddIncidentState {
  final Status status;

  const SelectIncidentStatus({
    required this.status,
  });

  @override
  List<Object> get props => [
        status,
      ];
}

final class SelectIncidentType extends AddIncidentState {
  final IncidentType incidentType;

  const SelectIncidentType({
    required this.incidentType,
  });

  @override
  List<Object> get props => [
        incidentType,
      ];
}

final class AddIncidentSuccessState extends AddIncidentState {
  final Incidents incidents;
  final String message;

  const AddIncidentSuccessState({
    required this.incidents,
    required this.message,
  });

  @override
  List<Object> get props => [
        incidents,
        message,
      ];
}

final class AddIncidentErrorState extends AddIncidentState {
  final String message;

  const AddIncidentErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

final class UploadImageSuccessState extends AddIncidentState {
  final String message;

  const UploadImageSuccessState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

final class UploadImageErrorState extends AddIncidentState {
  final String message;

  const UploadImageErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
