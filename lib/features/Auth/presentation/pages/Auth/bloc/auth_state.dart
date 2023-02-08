import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthStates extends Equatable{

  final bool isLoginMode;

  const AuthStates({required this.isLoginMode});

  @override
  List<Object?> get props => [isLoginMode];
}

class AuthInitialState extends AuthStates{
  const AuthInitialState({required super.isLoginMode});
  @override
  List<Object?> get props => [];

}

class AuthLoadingState extends AuthStates{

  const AuthLoadingState({required super.isLoginMode});

  @override
  List<Object?> get props => [];
}


class AuthSuccessState extends AuthStates{
  final bool isLoginStatus;
  final String message;
  const AuthSuccessState({required this.message,required this.isLoginStatus}) : super(isLoginMode: isLoginStatus);

  @override
  List<Object?> get props => [isLoginStatus];
}

class AuthSigUpState extends AuthStates{

  final bool isLoginStatus;
  const AuthSigUpState({required this.isLoginStatus}) : super(isLoginMode: isLoginStatus);

  @override
  List<Object?> get props => [isLoginStatus];

}

class AuthLoginState extends AuthStates{

  final bool isLoginStatus;
  const AuthLoginState({required this.isLoginStatus}) : super(isLoginMode: isLoginStatus);

  @override
  List<Object?> get props => [isLoginStatus];

}