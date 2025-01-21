import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWithPrefixIconWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelTitle;
  final String? errorMessage;
  final TextInputType textInputType;
  final void Function(String value) onChanged;
  final Widget prefixIcon;

  const CustomTextFieldWithPrefixIconWidget({
    super.key,
    required this.controller,
    required this.labelTitle,
    this.errorMessage,
    this.textInputType = TextInputType.text,
    required this.prefixIcon,
    required this.onChanged,
  });

  @override
  State<CustomTextFieldWithPrefixIconWidget> createState() =>
      _CustomTextFieldWithPrefixIconWidgetState();
}

class _CustomTextFieldWithPrefixIconWidgetState
    extends State<CustomTextFieldWithPrefixIconWidget> {
  final FocusNode _focus = FocusNode();
  bool _textFieldHasFocus = false;

  @override
  void initState() {
    _focus.addListener(() {
      setState(() {
        _textFieldHasFocus = _focus.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focus,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      onChanged: (value) => widget.onChanged(value),
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: ColorsManager.black, letterSpacing: -0.13),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.border,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsManager.border,
            ),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsManager.redError,
            ),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsManager.border,
            ),
            borderRadius: BorderRadius.circular(10)),
        errorText: widget.errorMessage,
        labelText: widget.labelTitle,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: _labelStyle(
          context,
          _textFieldHasFocus,
        ),
        errorMaxLines: 2,
        prefixIcon: widget.prefixIcon,
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }

  TextStyle _labelStyle(BuildContext context, bool hasFocus) {
    if (hasFocus || widget.controller.text.isNotEmpty) {
      return Theme.of(context).textTheme.titleLarge!.copyWith(
            color: widget.errorMessage == null
                ? ColorsManager.gray
                : ColorsManager.redError,
            letterSpacing: -0.13,
          );
    } else {
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: widget.errorMessage == null
                ? ColorsManager.gray
                : ColorsManager.redError,
            letterSpacing: -0.13,
          );
    }
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }
}
