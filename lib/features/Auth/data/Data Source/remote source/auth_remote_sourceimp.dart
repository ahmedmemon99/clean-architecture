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
  Future<UserModel> loginMethod(String email, String password) {
    return Future.value( UserModel(id: 'dd',email: 'fff',expires: DateTime.now()));
  }

  @override
  Future<UserModel?> signupMethod(String email, String password) async {
    try {
          final body = { 'email': email, 'password': password};
          http.Response response = await http.post(Uri.parse(AppApi.userSignupUrl), body: body);
          var data = json.decode(response.body);
          if(response.statusCode == 200){
              return UserModel.fromJson(json.decode(data));
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
