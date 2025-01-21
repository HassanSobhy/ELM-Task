import 'package:json_annotation/json_annotation.dart';

part 'change_incident_status_request.g.dart';

@JsonSerializable()
class ChangeIncidentStatusRequest {
  @JsonKey(name: 'incidentId')
  final String incidentId;
  @JsonKey(name: 'status')
  final int status;

  const ChangeIncidentStatusRequest({
    required this.incidentId,
    required this.status,
  });

  factory ChangeIncidentStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeIncidentStatusRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeIncidentStatusRequestToJson(this);

  @override
  String toString() {
    return 'ChangeIncidentStatusRequest{incidentId: $incidentId, status: $status,}';
  }
}
