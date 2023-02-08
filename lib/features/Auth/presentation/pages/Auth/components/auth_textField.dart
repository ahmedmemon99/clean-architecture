import 'package:flutter/material.dart';
import 'package:mvvm_example/core/utils/app_colors.dart';

class AuthTextField extends StatefulWidget {
      const
      AuthTextField(
          {
            Key? key,
            required this.hintText,
            required this.controller,
            this.isPassword = false,
            this.validation,
            this.isConfirmPassword = false,
            this.confirmPasswordValidation,
            this.passwordController,
            required this.filedKey,
          }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String? data)? validation;
  final bool isConfirmPassword;
  final String? Function(String val, String pasword)? confirmPasswordValidation;
  final TextEditingController? passwordController;
  final GlobalKey<FormFieldState> filedKey;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextFormField(
        key: widget.filedKey,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        obscureText: widget.isPassword,
        validator: !widget.isConfirmPassword ? widget.validation : (val) => widget.confirmPasswordValidation!(val!,widget.passwordController!.text),
        decoration: InputDecoration(
            hintText: widget.hintText,
            border: const OutlineInputBorder(borderSide: BorderSide()),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.activeButtonColor))),
      ),
    );
  }
}
