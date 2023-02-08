
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_example/core/utils/app_colors.dart';
import 'package:mvvm_example/core/utils/input_validation.dart';
import 'package:mvvm_example/core/utils/strings.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_bloc.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_state.dart';
import 'components/auth_textField.dart';
import 'login_viewmodel.dart';



class LoginView extends StatelessWidget {
   LoginView({Key? key}) : super(key: key);

  final TextEditingController _txtEmail = TextEditingController();

  final TextEditingController _txtPw = TextEditingController();

  final TextEditingController _txtCpw = TextEditingController();

  final GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> _pwKey = GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> _cfPWKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    print('login view rebuild');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          AppString.authAppBarTitle,
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTextField(
                      filedKey: _emailKey,
                      validation: AppInputValidation.validateEmail,
                      hintText: 'Enter Email',
                      controller: _txtEmail,
                    ),
                    AuthTextField(
                      filedKey: _pwKey,
                      isPassword: true,
                      validation: AppInputValidation.validatePassword,
                      hintText: 'Enter Password',
                      controller: _txtPw,
                    ),
                    BlocBuilder<AuthBloc,AuthStates>(
                        builder: (context, state) {
                          if(!state.isLoginMode){
                            return  AuthTextField(
                              passwordController: _txtPw,
                              isConfirmPassword: true,
                              confirmPasswordValidation: AppInputValidation.validateConfirmPassword,
                              isPassword: true,
                              hintText: 'Enter Confirm Password',
                              controller: _txtCpw,
                              filedKey: _cfPWKey,
                            );
                          }
                          return Container();
                        }),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.activeButtonColor,
                            fixedSize: const Size(200, 40),
                            textStyle: const TextStyle(color: AppColors.buttonTextColor)),
                        onPressed: () {
                          context.read<LoginViewModel>().authentication(
                              _txtEmail.text,
                              _txtPw.text,
                              _txtCpw.text,
                              _emailKey,
                              _pwKey,
                              _cfPWKey);
                          },
                        child: BlocBuilder<AuthBloc,AuthStates>(
                            builder: (context, state) {
                              if(state.isLoginMode){
                                return const Text(AppString.login);
                              }
                              if(!state.isLoginMode){
                                return const Text(AppString.signup);
                              }
                               return Container();
                            }
                        )),
                    TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.activeButtonColor,
                          fixedSize: const Size(200, 40),),
                        onPressed: () => context.read<LoginViewModel>().switchStatus(),
                        child: BlocBuilder<AuthBloc,AuthStates>(
                          builder: (context, state) {
                            if(state.isLoginMode){
                              return const Text(AppString.createAccount);
                            }
                            if(!state.isLoginMode){
                              return const Text(AppString.alreadyAccount);
                            }
                             return Container();
                          }
                        )),

                  ],
                ),
              )
            ],
      ),
    );
  }
}
