import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_bloc.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_event.dart';

class LoginViewModel{

  LoginViewModel({required this.authBloc});

  final bool _isLogin = true;

  bool get isLogin => _isLogin;

  AuthBloc authBloc;
  void createAccount(String email,String password,String confirmPw,BuildContext context,){
    context.read<AuthBloc>().add(AuthSignupEvent(email: email, password: password, confirmPw: confirmPw));
  }

}