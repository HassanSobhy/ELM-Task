import 'package:equatable/equatable.dart';

class Dashboard extends Equatable {
  final int id;
  final String name;
  final int value;
  final int total;

  const Dashboard({
    this.value = 0,
    this.name = "",
    this.id = -1,
    this.total = 0,
  });

  @override
  List<Object> get props => [
    id,
    name,
    value,
    total,
  ];
}
