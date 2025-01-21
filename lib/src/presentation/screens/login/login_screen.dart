import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/config/route/routes_manager.dart';
import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:elm_task/src/core/base/widget/base_stateful_widget.dart';
import 'package:elm_task/src/core/resources/image_paths.dart';
import 'package:elm_task/src/core/utils/helper/show_snack_bar.dart';
import 'package:elm_task/src/presentation/blocs/login/login_bloc.dart';
import 'package:elm_task/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:elm_task/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:elm_task/src/presentation/widgets/custom_text_field_with_prefix_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends BaseStatefulWidget {
  const LoginScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  LoginBloc get _bloc => BlocProvider.of<LoginBloc>(context);
  final TextEditingController _emailController = TextEditingController();
  String? emailErrorMessage;

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(
        context,
        title: S.of(context).login,
        isHaveBackButton: false,
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is ShowLoadingState) {
            showLoading();
          } else if (state is HideLoadingState) {
            hideLoading();
          } else if (state is ValidEmailState) {
            emailErrorMessage = null;
          } else if (state is InValidEmailState) {
            emailErrorMessage = state.message;
          } else if (state is LoginSuccessState) {
            _navigateToOTPScreen(
              context,
              state.email,
            );
          } else if (state is LoginErrorState) {
            showSnackBar(
              context: context,
              message: state.message,
              color: ColorsManager.redError,
              icon: ImagePaths.error,
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 128,
                ),
                CustomTextFieldWithPrefixIconWidget(
                  controller: _emailController,
                  labelTitle: S.of(context).email,
                  prefixIcon: SvgPicture.asset(
                    ImagePaths.email,
                    fit: BoxFit.scaleDown,
                  ),
                  errorMessage: emailErrorMessage,
                  textInputType: TextInputType.emailAddress,
                  onChanged: (value) {
                    _validateEmailEvent(value);
                  },
                ),
                const Spacer(),
                CustomGradientButtonWidget(
                  text: S.of(context).login,
                  onTap: () {
                    _loginRequestEvent(_emailController.text.trim());
                  },
                  isEnable: _isButtonEnabled(),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  bool _isButtonEnabled() {
    return emailErrorMessage == null && _emailController.text.isNotEmpty;
  }

  void _validateEmailEvent(String email) {
    _bloc.add(ValidateEmailEvent(email: email));
  }

  void _loginRequestEvent(String email) {
    _bloc.add(LoginRequestEvent(email: email));
  }

  void _navigateToOTPScreen(BuildContext context, String email) {
    Navigator.pushNamed(
      context,
      Routes.otp,
      arguments: {
        "email": email,
      },
    );
  }
}
