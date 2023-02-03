import '../entity/user.dart';
import '../repository/auth_repository.dart';

class AuthUseCase{

  AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  Future<User> createUser(String email,String password){
    return authRepository.createUser(email, password);
  }

}