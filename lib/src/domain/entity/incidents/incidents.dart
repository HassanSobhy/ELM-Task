import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:equatable/equatable.dart';

class Incidents extends Equatable {
  final List<Incident> incidents;

  const Incidents({
    this.incidents = const [],
  });

  @override
  List<Object> get props => [
    incidents,
      ];
}
