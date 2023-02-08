import 'dart:io';

import 'package:mvvm_example/features/Auth/data/Data%20Source/remote%20source/auth_remote_source.dart';
import 'package:mvvm_example/features/Auth/domain/entity/user.dart';
import 'package:mvvm_example/features/Auth/domain/repository/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository{

  AuthRemoteSource authRemoteSource;

  AuthRepositoryImp({required this.authRemoteSource});


  @override
  Future<User> createUser(String email, String password)async{
        final result = await authRemoteSource.signupMethod(email, password);
        return result!.toEntity();
  }

  @override
  Future<User> loginUser(String email, String password) async{
       final result = await authRemoteSource.loginMethod(email, password);
       return result!.toEntity();
  }

}