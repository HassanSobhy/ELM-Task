import 'package:equatable/equatable.dart';

class IncidentCount extends Equatable {
  final int status;

  const IncidentCount({
    this.status = 0,
  });

  @override
  List<Object> get props => [
        status,
      ];
}
