import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_example/core/utils/app_api.dart';
import 'package:mvvm_example/core/utils/app_colors.dart';
import 'package:mvvm_example/core/utils/input_validation.dart';
import 'package:mvvm_example/core/utils/strings.dart';
import 'package:mvvm_example/features/Auth/data/Data%20Source/remote%20source/auth_remote_source.dart';
import 'package:mvvm_example/features/Auth/data/Data%20Source/remote%20source/auth_remote_sourceimp.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/login_viewmodel.dart';
import '../../../../../core/exeptions.dart';
import '../../../data/models/user_model.dart';
import 'components/auth_textField.dart';

import 'package:http/http.dart' as http;

class LoginView extends StatelessWidget {
    LoginView({Key? key}) : super(key: key);

  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtPw = TextEditingController();
  final TextEditingController _txtCpw = TextEditingController();


   final  LoginViewModel loginViewModel = LoginViewModel(authBloc: context.r);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        centerTitle: true,
        title: const Text('Authentication',),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthTextField(
                  validation: AppInputValidation.validateEmail,
                  hintText: 'Enter Email',
                  controller: _txtEmail,
                ),
                AuthTextField(
                  isPassword: true,
                  validation: AppInputValidation.validatePassword,
                  hintText: 'Enter Password',
                  controller: _txtPw,
                ),
                AuthTextField(
                  isConfirmPassword: true,
                  confirmPasswordValidation: AppInputValidation.validateConfirmPassword,
                  isPassword: true,
                  hintText: 'Enter Confirm Password',
                  controller: _txtCpw,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.activeButtonColor,
                        fixedSize: const Size(200, 40),
                        textStyle: const TextStyle(color: AppColors.buttonTextColor)),
                    onPressed: ()async{

                      loginViewModel.createAccount(_txtEmail.text, _txtPw.text, _txtCpw.text, context);

                    }, child: const Text(AppString.login)),
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.activeButtonColor,
                      fixedSize: const Size(200, 40),),
                    onPressed: (){}, child: const Text('Create an account?'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
