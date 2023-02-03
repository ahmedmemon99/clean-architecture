import 'package:equatable/equatable.dart';

abstract class AuthEvents extends Equatable{

}


class AuthLoginEvent extends AuthEvents{

  AuthLoginEvent({required this.email,required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email,password];

}

class AuthSignupEvent extends AuthEvents{

  AuthSignupEvent({required this.email,required this.password,required this.confirmPw});

  final String email;
  final String password;
  final String confirmPw;

  @override
  List<Object?> get props => [email,password,confirmPw];

}
