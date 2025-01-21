import 'package:elm_task/src/domain/entity/incidents/incident_count.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_incident_count.g.dart';

@JsonSerializable()
class RemoteIncidentCount {
  @JsonKey(name: 'status')
  final int? status;

  const RemoteIncidentCount({
    this.status = 0,
  });

  factory RemoteIncidentCount.fromJson(Map<String, dynamic> json) =>
      _$RemoteIncidentCountFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIncidentCountToJson(this);
}

extension RemoteIncidentCountExtension on RemoteIncidentCount {
  IncidentCount mapToDomain() {
    return IncidentCount(
      status: status ?? 0,
    );
  }
}
