import 'package:equatable/equatable.dart';

class SubmitIncidentForm extends Equatable {
  final String description;
  final double latitude;
  final double longitude;
  final int typeId;
  final int status;
  final int priority;
  final String issuerId;

  const SubmitIncidentForm({
    this.description = "",
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.typeId = 0,
    this.status = 0,
    this.priority = 0,
    this.issuerId = "",
  });

  @override
  List<Object> get props => [
        description,
        latitude,
        longitude,
        typeId,
        status,
        priority,
        issuerId,
      ];
}
