import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/config/route/routes_manager.dart';
import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:elm_task/src/core/base/widget/base_stateful_widget.dart';
import 'package:elm_task/src/core/resources/image_paths.dart';
import 'package:elm_task/src/core/utils/helper/show_snack_bar.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_type_credential.dart';
import 'package:elm_task/src/presentation/blocs/incidents/incidents_bloc.dart';
import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:elm_task/src/presentation/screens/incidents/widgets/incidents_widget.dart';
import 'package:elm_task/src/presentation/screens/incidents/widgets/statuses_widget.dart';
import 'package:elm_task/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncidentScreen extends BaseStatefulWidget {
  const IncidentScreen({
    super.key,
  });

  @override
  BaseState<IncidentScreen> baseCreateState() => _IncidentListScreenState();
}

class _IncidentListScreenState extends BaseState<IncidentScreen> {
  IncidentsBloc get _bloc => BlocProvider.of<IncidentsBloc>(context);

  List<Incident> _incidents = [];
  List<Incident> _filteredIncidents = [];
  List<IncidentType> _incidentTypes = [];
  Status _selectedStatus = Status.All;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _bloc.add(const GetIncidentsEvent());
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F8),
      appBar: buildAppBarWidget(
        context,
        title: S.of(context).incidents,
        isHaveBackButton: false,
        actionWidget: [
          InkWell(
            onTap: () {
              _navigateToDashboardScreen(context);
            },
            child: Icon(
              Icons.dashboard_outlined,
              color: ColorsManager.primary,
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              _logoutEvent();
            },
            child: Icon(
              Icons.logout,
              color: ColorsManager.primary,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.primary,
        onPressed: () {
          _navigateToIncidentFormScreen(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocConsumer<IncidentsBloc, IncidentsState>(
        listener: (context, state) {
          if (state is ShowLoadingState) {
            showLoading();
          } else if (state is HideLoadingState) {
            hideLoading();
          } else if (state is GetIncidentsSuccessState) {
            _incidents = state.incidents;
            _filteredIncidents = _incidents;
            _incidentTypes = state.incidentTypes;
          } else if (state is GetIncidentsFailedState) {
            showSnackBar(
              context: context,
              message: state.message,
              color: ColorsManager.redError,
              icon: ImagePaths.error,
            );
          } else if (state is FilterIncidentByStatusAndDateState) {
            _filteredIncidents = state.incidents;
            _selectedStatus = state.status;
          } else if (state is LogoutState) {
            _navigateToLoginScreen();
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      StatusesWidget(
                        selectedStatus: _selectedStatus,
                        statuses: [
                          Status.All,
                          Status.Submitted,
                          Status.InProgress,
                          Status.Completed,
                          Status.Rejected
                        ],
                        onTap: (status) {
                          _bloc.add(
                            FilterIncidentByStatusAndDateEvent(
                              allIncidents: _incidents,
                              status: status,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: _buildBody(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    if (_filteredIncidents.isEmpty) {
      return Center(
        child: Text(
          S.of(context).noIncidentsFound,
          style: TextStyle(
            fontSize: 20,
            color: ColorsManager.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return IncidentsWidget(
      incidents: _filteredIncidents,
      incidentTypes: _incidentTypes,
      onTap: (incident) {
        _navigateToIncidentDetailsScreen(context, incident);
      },
    );
  }

  void _logoutEvent() {
    _bloc.add(const LogoutEvent());
  }

  void _navigateToDashboardScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.dashboard,
    );
  }

  void _navigateToIncidentDetailsScreen(
    BuildContext context,
    Incident incident,
  ) {
    Navigator.pushNamed(
      context,
      Routes.incidentDetails,
      arguments: {
        "incident": incident,
      },
    );
  }

  void _navigateToIncidentFormScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.addIncident,
    );
  }

  void _navigateToLoginScreen() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.login,
      (route) => false,
    );
  }
}
