import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:elm_task/src/core/base/widget/base_stateful_widget.dart';
import 'package:elm_task/src/core/resources/image_paths.dart';
import 'package:elm_task/src/core/utils/helper/show_snack_bar.dart';
import 'package:elm_task/src/domain/entity/incidents/dashboard.dart';
import 'package:elm_task/src/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:elm_task/src/presentation/screens/dashboard/widgets/summary_widget.dart';
import 'package:elm_task/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends BaseStatefulWidget {
  const DashboardScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _DashboardScreenState();
}

class _DashboardScreenState extends BaseState<DashboardScreen> {
  DashboardBloc get _bloc => BlocProvider.of<DashboardBloc>(context);

  @override
  void initState() {
    _getDashboardData();
    super.initState();
  }

  List<Dashboard> _dashboardData = [];

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGrayBackground,
      appBar: buildAppBarWidget(
        context,
        title: S.of(context).dashboard,
        isHaveBackButton: true,
        onBackButtonPressed: () {
          _navigateBack(context);
        },
      ),
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is ShowLoadingState) {
            showLoading();
          } else if (state is HideLoadingState) {
            hideLoading();
          } else if (state is DashboardSuccessState) {
            _dashboardData = state.dashboardData;
          } else if (state is DashboardErrorState) {
            showSnackBar(
              context: context,
              message: state.message,
              color: ColorsManager.redError,
              icon: ImagePaths.error,
            );
          }
        },
        builder: (context, state) {
          return _dashboardData.isEmpty
              ? Center(
                  child: Text("No Data Found"),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorsManager.gray.withOpacity(0.4),
                                  blurRadius: 2)
                            ]),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 12, top: 12),
                          child: SfCircularChart(
                            margin: EdgeInsets.zero,
                            enableMultiSelection: true,
                            series: [
                              PieSeries<Dashboard, String>(
                                dataSource: _dashboardData ?? [],
                                xValueMapper: (Dashboard ch, _) => ch.name,
                                yValueMapper: (Dashboard ch, _) => ch.value,
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  connectorLineSettings:
                                      const ConnectorLineSettings(
                                    length: '9%',
                                    width: 1.1,
                                    color: ColorsManager
                                        .dividerColor, // Customize the connector line color
                                  ),
                                  labelPosition: ChartDataLabelPosition.outside,
                                ),
                                dataLabelMapper: (Dashboard data, _) =>
                                    data.id != -1
                                        ? "${data.name}: ${data.value}"
                                        : "${data.name}: 0",
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SummaryWidget(
                        dashboardData: _dashboardData,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  void _getDashboardData() {
    _bloc.add(DashboardGetDataEvent());
  }

  void _navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
