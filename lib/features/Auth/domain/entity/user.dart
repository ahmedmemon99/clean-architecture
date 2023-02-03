import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final DateTime expires;

  const User({required this.id, required this.email, required this.expires});

  @override
  List<Object?> get props => [id, email, expires];
}
