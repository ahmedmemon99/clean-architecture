

import 'package:mvvm_example/features/Auth/data/models/user_model.dart';

import '../../../domain/entity/user.dart';

abstract class AuthRemoteSource{

  Future<UserModel?> signupMethod(String email,String password);
  Future<UserModel?> loginMethod(String email,String password);

}