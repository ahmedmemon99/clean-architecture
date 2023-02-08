import 'package:equatable/equatable.dart';
import 'package:mvvm_example/features/Auth/domain/entity/user.dart';

class UserModel extends Equatable {

  final String id;
  final String email;
  final DateTime expires;


  const UserModel({required this.id, required this.email, required this.expires});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
                    id: json['localId'],
                    email: json['email'],
                    expires: DateTime.now().add(Duration(seconds: int.parse(json['expiresIn'])))
                  );
             }

  @override
  List<Object?> get props => [id, email, expires];
    User toEntity(){
      return User(
        id: id,
        email: email,
        expires: expires
      );
    }

}