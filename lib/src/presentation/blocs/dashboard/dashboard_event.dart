part of 'dashboard_bloc.dart';

sealed class  DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardGetDataEvent extends DashboardEvent {}
