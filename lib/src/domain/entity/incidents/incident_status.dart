import 'package:elm_task/src/domain/entity/incidents/incident_count.dart';
import 'package:equatable/equatable.dart';

class IncidentStatus extends Equatable{
  final int status;
  final IncidentCount count;

  const IncidentStatus({
    this.status = 0,
    this.count = const IncidentCount(),
  });

  @override
  List<Object> get props => [
    status,
    count,
  ];
}