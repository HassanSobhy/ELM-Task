import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incident_count.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_count.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_incident_status.g.dart';

@JsonSerializable()
class RemoteIncidentStatus {
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: '_count')
  final RemoteIncidentCount? count;

  const RemoteIncidentStatus({
    this.status = 0,
    this.count = const RemoteIncidentCount(),
  });

  factory RemoteIncidentStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteIncidentStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIncidentStatusToJson(this);
}

extension RemoteIncidentStatusExtension on RemoteIncidentStatus {
  IncidentStatus mapToDomain() {
    return IncidentStatus(
      status: status ?? 0,
      count: count?.mapToDomain() ?? IncidentCount(),
    );
  }
}
