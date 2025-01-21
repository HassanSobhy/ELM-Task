import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:elm_task/src/core/base/widget/base_stateful_widget.dart';
import 'package:elm_task/src/core/resources/image_paths.dart';
import 'package:elm_task/src/core/utils/helper/show_snack_bar.dart';
import 'package:elm_task/src/presentation/blocs/incident_details/incident_details_cubit.dart';
import 'package:elm_task/src/presentation/screens/incident_details/widgets/change_status_widget.dart';
import 'package:elm_task/src/presentation/screens/incident_details/widgets/incident_info_widget.dart';
import 'package:elm_task/src/presentation/screens/incident_details/widgets/location_widget.dart';
import 'package:elm_task/src/presentation/screens/incident_details/widgets/media_widget.dart';
import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:elm_task/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncidentDetailsScreen extends BaseStatefulWidget {
  final Incident incident;

  const IncidentDetailsScreen({
    super.key,
    required this.incident,
  });

  @override
  BaseState<IncidentDetailsScreen> baseCreateState() =>
      _IncidentDetailsScreenState();
}

class _IncidentDetailsScreenState extends BaseState<IncidentDetailsScreen> {
  IncidentDetailsCubit get _cubit =>
      BlocProvider.of<IncidentDetailsCubit>(context);

  Status _selectedStatus = Status.All;
  Incident _incident = Incident();

  @override
  void initState() {
    super.initState();
    _selectedStatus = Status.fromValue(widget.incident.status);
    _incident = widget.incident;
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(
        context,
        title: S.of(context).incidentDetails,
        isHaveBackButton: true,
        onBackButtonPressed: () {
          _navigateBack(context);
        },
      ),
      body: BlocConsumer<IncidentDetailsCubit, IncidentDetailsState>(
        listener: (context, state) {
          if (state is ShowLoadingState) {
            showLoading();
          } else if (state is HideLoadingState) {
            hideLoading();
          } else if (state is SelectIncidentStatus) {
            _selectedStatus = state.status;
          } else if (state is ChangeIncidentStatusSuccessState) {
            _incident = state.incident;
            showSnackBar(
              context: context,
              message: state.message,
              color: ColorsManager.green,
              icon: ImagePaths.success,
            );
          } else if (state is ChangeIncidentStatusErrorState) {
            showSnackBar(
              context: context,
              message: state.message,
              color: ColorsManager.redError,
              icon: ImagePaths.error,
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _incident.description,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 16),
                IncidentInfoWidget(
                  incident: _incident,
                ),
                const SizedBox(height: 16),
                MediaWidget(
                  media: _incident.media,
                ),
                const SizedBox(height: 16),
                LocationWidget(
                  incident: _incident,
                ),
                const SizedBox(height: 16),
                ChangeStatusWidget(
                  selectedStatus: _selectedStatus,
                  onSelectedStatus: (status) {
                    _selectStatus(status);
                  },
                  onUpdateStatus: (status) {
                    _changeIncidentStatus(
                      _incident.id,
                      status.value,
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }

  void _selectStatus(Status status) {
    _cubit.selectStatus(status);
  }

  void _changeIncidentStatus(String incidentId, int statusId) {
    if (statusId == _incident.status) {
      return;
    }
    _cubit.changeIncidentStatus(
      incidentId: _incident.id,
      statusId: _selectedStatus.value,
    );
  }

  void _navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
