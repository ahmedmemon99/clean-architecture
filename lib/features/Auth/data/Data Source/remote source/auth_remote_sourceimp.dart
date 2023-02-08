import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:mvvm_example/core/exeptions.dart';
import 'package:mvvm_example/core/utils/app_api.dart';
import 'package:mvvm_example/core/utils/strings.dart';
import 'package:mvvm_example/features/Auth/data/models/user_model.dart';
import 'package:mvvm_example/features/Auth/domain/entity/user.dart';
import 'package:http/http.dart' as http;
import 'auth_remote_source.dart';

class AuthRemoteSourceImp extends AuthRemoteSource {
  @override
  Future<UserModel?> loginMethod(String email, String password) async{
    try {
          final body = { 'email': email, 'password': password};
          http.Response response = await http.post(Uri.parse(AppApi.userLoginUrl), body: body);
          var data = json.decode(response.body);
          if(response.statusCode == 200){
             return UserModel.fromJson(data);
          }else if(data['error']['message'] == 'EMAIL_NOT_FOUND'){
             throw EmailExistsException('User doesn\'t Exists', 'user not found');
          }else if(data['error']['message'] == 'INVALID_PASSWORD'){
             throw InvalidPasswordException('invalid password', 'please enter valid password');
          }else if(data['error']['message'] == 'INVALID_PASSWORD'){
             throw TooManyAttempts('temporary disabled', 'due to too may attempt account disabled');
          }
      }on SocketException catch(e){
           throw ServerNotRespondingException();
      }
         return null;
  }

  @override
  Future<UserModel?> signupMethod(String email, String password) async {
    try {
          final body = { 'email': email, 'password': password};
          http.Response response = await http.post(Uri.parse(AppApi.userSignupUrl), body: body);
          var data = json.decode(response.body);
          if(response.statusCode == 200){
              log(response.body);
              return UserModel.fromJson(data);
          }else if(data['error']['message'] == 'EMAIL_EXISTS'){
              throw EmailExistsException('Email already Exists', 'user already exists');
          }else if(data['error']['message'] == 'OPERATION_NOT_ALLOWED'){
              throw ServerNotRespondingException();
          }
      }on SocketException{
          throw ServerNotRespondingException();
      }
            return null;
  }



}
