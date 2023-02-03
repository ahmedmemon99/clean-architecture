import 'package:equatable/equatable.dart';

abstract class AuthStates extends Equatable{


}

class AuthInitialState extends AuthStates{

  @override
  List<Object?> get props => [];

}

class AuthLoadingState extends AuthStates{

  @override
  List<Object?> get props => [];
}


class AuthSuccessState extends AuthStates{

  final String message;
  AuthSuccessState({required this.message});

  @override
  List<Object?> get props => [];
}