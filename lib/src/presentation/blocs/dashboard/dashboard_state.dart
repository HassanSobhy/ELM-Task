part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class ShowLoadingState extends DashboardState {}

class HideLoadingState extends DashboardState {}

class DashboardSuccessState extends DashboardState {
  final List<Dashboard> dashboardData;

  const DashboardSuccessState({
    required this.dashboardData,
  });

  @override
  List<Object> get props => [
    dashboardData,
  ];
}

class DashboardErrorState extends DashboardState {
  final String message;

  const DashboardErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
    message,
  ];
}
