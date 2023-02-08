import 'package:mvvm_example/features/Auth/data/repository/auth_repositoryImp.dart';

import '../entity/user.dart';
import '../repository/auth_repository.dart';

class AuthUseCase{

  AuthRepositoryImp authRepositoryImp;

  AuthUseCase({required this.authRepositoryImp});

  Future<User> createUser(String email,String password){
    return authRepositoryImp.createUser(email, password);
  }

}