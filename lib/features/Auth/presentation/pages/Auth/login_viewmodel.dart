import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_bloc.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_event.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_state.dart';

class LoginViewModel{

  LoginViewModel({required this.authBloc});

  AuthBloc authBloc;

  void authentication(String email,String password,String confirmPw,GlobalKey<FormFieldState> emailKey,GlobalKey<FormFieldState> pwKey,GlobalKey<FormFieldState> cfKey){

    if(authBloc.state is AuthSigUpState){

        emailKey.currentState!.validate();
        pwKey.currentState!.validate();
        cfKey.currentState!.validate();

        if(emailKey.currentState!.isValid && pwKey.currentState!.isValid && cfKey.currentState!.isValid){
          if(authBloc.state.isLoginMode){


          }else{

            authBloc.add(AuthSignupEvent(email: email, password: password, confirmPw: confirmPw));
           }
        }
    }
  }

  void switchStatus(){
    authBloc.add(AuthSwitchEvent());
  }

}