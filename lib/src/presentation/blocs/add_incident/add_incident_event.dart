part of 'add_incident_bloc.dart';

sealed class AddIncidentEvent extends Equatable {
  const AddIncidentEvent();

  @override
  List<Object> get props => [];
}

final class GetIncidentTypesEvent extends AddIncidentEvent {}

final class SelectStatusEvent extends AddIncidentEvent {
  final Status status;

  const SelectStatusEvent({
    required this.status,
  });

  @override
  List<Object> get props => [
        status,
      ];
}

final class SelectIncidentTypeEvent extends AddIncidentEvent {
  final IncidentType incidentType;

  const SelectIncidentTypeEvent({
    required this.incidentType,
  });

  @override
  List<Object> get props => [
        incidentType,
      ];
}

final class UploadImageEvent extends AddIncidentEvent {
  final String imagePath;

  const UploadImageEvent({
    required this.imagePath,
  });

  @override
  List<Object> get props => [
        imagePath,
      ];
}

final class AddNewIncidentEvent extends AddIncidentEvent {
  final SubmitIncidentForm form;

  const AddNewIncidentEvent({
    required this.form,
  });

  @override
  List<Object> get props => [
        form,
      ];
}
