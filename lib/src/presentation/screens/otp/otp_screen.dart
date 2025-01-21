import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/config/route/routes_manager.dart';
import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:elm_task/src/core/base/widget/base_stateful_widget.dart';
import 'package:elm_task/src/core/resources/image_paths.dart';
import 'package:elm_task/src/core/utils/helper/show_snack_bar.dart';
import 'package:elm_task/src/presentation/blocs/otp/otp_bloc.dart';
import 'package:elm_task/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:elm_task/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends BaseStatefulWidget {
  final String email;

  const OtpScreen({
    super.key,
    required this.email,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _OtpScreenState();
}

class _OtpScreenState extends BaseState<OtpScreen> {
  OtpBloc get _bloc => BlocProvider.of<OtpBloc>(context);
  String otp = "";

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(
        context,
        title: S.of(context).otp,
        isHaveBackButton: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: BlocConsumer<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is ShowLoadingState) {
            showLoading();
          } else if (state is HideLoadingState) {
            hideLoading();
          } else if (state is VerifyOTPSuccessState) {
            _navigateToHomeScreen(
              context,
            );
          } else if (state is VerifyOTPErrorState) {
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
                const SizedBox(height: 24),
                Text(
                  S.of(context).pleaseEnterOTPYouReceived,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 24,
                      ),
                ),
                const SizedBox(height: 66),
                Pinput(
                  length: 4,
                  onChanged: (pin) {
                    otp = pin;
                    setState(() {});
                  },
                ),
                const Spacer(),
                CustomGradientButtonWidget(
                  text: S.of(context).verify,
                  onTap: () {
                    _bloc.add(
                      VerifyOtpEvent(
                        otp: otp,
                        email: widget.email,
                      ),
                    );
                  },
                  isEnable: otp.length == 4,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.incidents,
      (route) => false,
    );
  }
}
