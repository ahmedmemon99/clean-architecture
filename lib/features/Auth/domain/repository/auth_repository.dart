import '../entity/user.dart';

abstract class AuthRepository {

  Future<User> createUser(String email,String password);
  Future<User> loginUser(String email,String password);


}