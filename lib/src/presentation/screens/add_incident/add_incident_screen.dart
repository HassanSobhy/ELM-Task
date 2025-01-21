import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:elm_task/src/core/base/widget/base_stateful_widget.dart';
import 'package:elm_task/src/core/resources/image_paths.dart';
import 'package:elm_task/src/core/utils/helper/show_snack_bar.dart';
import 'package:elm_task/src/core/utils/permission/permissions.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_type_credential.dart';
import 'package:elm_task/src/domain/entity/incidents/submit_incident_form.dart';
import 'package:elm_task/src/presentation/blocs/add_incident/add_incident_bloc.dart';
import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:elm_task/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:elm_task/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:elm_task/src/presentation/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class AddIncidentScreen extends BaseStatefulWidget {
  const AddIncidentScreen({super.key});

  @override
  BaseState<AddIncidentScreen> baseCreateState() => _AddIncidentScreenState();
}

class _AddIncidentScreenState extends BaseState<AddIncidentScreen> {
  AddIncidentBloc get _bloc => BlocProvider.of<AddIncidentBloc>(context);

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _issuerIdController = TextEditingController();

  List<IncidentType> _incidentTypes = [];
  IncidentType _selectedIncidentType = IncidentType(
    id: 1,
  );
  Status _selectedStatus = Status.Submitted; // De

  @override
  void initState() {
    super.initState();
    _bloc.add(GetIncidentTypesEvent());
  }
  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AddIncidentBloc, AddIncidentState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetIncidentTypesSuccessState) {
          _incidentTypes = state.incidentTypes;
          print(_incidentTypes.length);
        } else if (state is GetIncidentTypesErrorState) {
          showSnackBar(
            context: context,
            message: state.message,
            color: ColorsManager.redError,
            icon: ImagePaths.error,
          );
        } else if (state is SelectIncidentStatus) {
          _selectedStatus = state.status;
        } else if (state is SelectIncidentType) {
          _selectedIncidentType = state.incidentType;
        } else if (state is UploadImageSuccessState) {
          showSnackBar(
            context: context,
            message: state.message,
            color: ColorsManager.green,
            icon: ImagePaths.success,
          );
        } else if (state is UploadImageErrorState) {
          showSnackBar(
            context: context,
            message: state.message,
            color: ColorsManager.redError,
            icon: ImagePaths.error,
          );
        } else if (state is AddIncidentSuccessState) {
          showSnackBar(
            context: context,
            message: state.message,
            color: ColorsManager.green,
            icon: ImagePaths.success,
          );
        } else if (state is AddIncidentErrorState) {
          showSnackBar(
            context: context,
            message: state.message,
            color: ColorsManager.redError,
            icon: ImagePaths.error,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(
            context,
            title: "Add Incident",
            isHaveBackButton: true,
            onBackButtonPressed: () {
              _navigateBack(context);
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldWidget(
                    controller: _descriptionController,
                    hintText: "Description",
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.text,
                    onChange: (value) {},
                    borderRadius: 16,
                    height: 48,
                    isEnabled: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  CustomTextFieldWidget(
                    controller: _priorityController,
                    hintText: "Priority",
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.number,
                    onChange: (value) {},
                    borderRadius: 16,
                    height: 48,
                    isEnabled: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldWidget(
                    controller: _issuerIdController,
                    hintText: "Issuer ID",
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.text,
                    onChange: (value) {},
                    borderRadius: 16,
                    height: 48,
                    isEnabled: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildStatusDropdown(),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildTypeDropdown(),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          PermissionStatus status =
                              await askPermission(getCameraPermission());
                          await checkPermission(status, ImageSource.camera);
                        },
                        icon: Icon(Icons.camera_alt),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      IconButton(
                        onPressed: () async {
                          PermissionStatus status = await askPermission(
                              getSingleImageGalleryPermission());
                          await checkPermission(status, ImageSource.gallery);
                        },
                        icon: Icon(Icons.image),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  CustomGradientButtonWidget(
                    onTap: () {
                      _bloc.add(
                        AddNewIncidentEvent(
                          form: SubmitIncidentForm(
                            description: _descriptionController.text,
                            priority: int.tryParse(_priorityController.text) ?? 0,
                            issuerId: _issuerIdController.text,
                            status: _selectedStatus.value,
                            typeId: _selectedIncidentType.id,
                            latitude: 0.0,
                            longitude: 0.0,
                          ),
                        ),
                      );
                    },
                    text: "Add Incident",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusDropdown() {
    return DropdownButtonFormField<int>(
      value: _selectedStatus.value,
      decoration: const InputDecoration(
        labelText: "Status",
        border: OutlineInputBorder(),
      ),
      items: [
        DropdownMenuItem(value: 0, child: Text(S.of(context).submitted)),
        DropdownMenuItem(value: 1, child: Text(S.of(context).inProgress)),
        DropdownMenuItem(value: 2, child: Text(S.of(context).completed)),
        DropdownMenuItem(value: 3, child: Text(S.of(context).rejected)),
      ],
      onChanged: (value) {
        if (value != null) {
          _bloc.add(SelectStatusEvent(status: Status.fromValue(value)));
        }
      },
    );
  }

  Widget _buildTypeDropdown() {
    return DropdownButtonFormField<int>(
      value: _selectedIncidentType.id,
      decoration: const InputDecoration(
        labelText: "Type ID",
        border: OutlineInputBorder(),
      ),
      items: _incidentTypes
          .map(
            (incidentType) => DropdownMenuItem(
              value: incidentType.id,
              child: Text(
                incidentType.englishName,
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value != null) {
          _bloc.add(
            SelectIncidentTypeEvent(
              incidentType:
                  _incidentTypes.where((element) => element.id == value).first,
            ),
          );
        }
      },
    );
  }

  void _navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> checkPermission(
    PermissionStatus status,
    ImageSource source,
  ) async {
    switch (status) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
        await _pickImage(source);
        break;

      case PermissionStatus.denied:
        break;

      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.restricted:
        openAppSettings().then((value) async {
          PermissionStatus status =
              await askPermission(getSingleImageGalleryPermission());
          if (status == PermissionStatus.granted ||
              status == PermissionStatus.limited) {
            await _pickImage(source);
          }
        });
        break;

      default:
        break;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      _bloc.add(UploadImageEvent(imagePath: image.path));
    }
  }
}
