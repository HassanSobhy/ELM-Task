import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incident_status.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_dashboard.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_incident_dashboard.g.dart';

@JsonSerializable()
class RemoteIncidentDashboard {
  @JsonKey(name: 'incidents')
  final List<RemoteIncidentStatus> incidents;

  const RemoteIncidentDashboard({
    this.incidents = const [],
  });

  factory RemoteIncidentDashboard.fromJson(Map<String, dynamic> json) =>
      _$RemoteIncidentDashboardFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIncidentDashboardToJson(this);
}

extension RemoteIncidentDashboardExtension on RemoteIncidentDashboard {
  IncidentDashboard mapToDomain() {
    return IncidentDashboard(
      incidents: incidents.map((e) => e.mapToDomain()).toList(),
    );
  }
}
