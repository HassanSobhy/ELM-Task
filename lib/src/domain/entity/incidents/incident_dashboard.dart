import 'package:elm_task/src/domain/entity/incidents/incident_status.dart';
import 'package:equatable/equatable.dart';

class IncidentDashboard extends Equatable{
  final List<IncidentStatus> incidents;

  const IncidentDashboard({
    this.incidents = const [],
  });

  @override
  List<Object> get props => [
    incidents,
  ];
}