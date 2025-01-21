import 'package:elm_task/src/domain/entity/incidents/submit_incident_form.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_incident_request.g.dart';

@JsonSerializable()
class SubmitIncidentRequest {
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'latitude')
  final double latitude;
  @JsonKey(name: 'longitude')
  final double longitude;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'typeId')
  final int typeId;
  @JsonKey(name: 'priority')
  final int priority;
  @JsonKey(name: 'issuerId')
  final String issuerId;

  const SubmitIncidentRequest({
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.typeId,
    required this.priority,
    required this.issuerId,
  });

  factory SubmitIncidentRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitIncidentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitIncidentRequestToJson(this);

  @override
  String toString() {
    return 'SubmitIncidentRequest{description: $description, latitude: $latitude, longitude: $longitude, status: $status, typeId: $typeId, priority: $priority, issuerId: $issuerId,}';
  }

}

extension SubmitIncidentRequestExtension on SubmitIncidentForm {
  SubmitIncidentRequest toRequest() {
    return SubmitIncidentRequest(
      description: description,
      latitude: latitude,
      longitude: longitude,
      status: status,
      typeId: typeId,
      priority: priority,
      issuerId: issuerId,
    );
  }
}
