class AuthException implements Exception{

  final String message;
  final String prefix;

  AuthException({required this.message,required this.prefix});


  @override
  String toString() {
    return message;
  }
}

class EmailExistsException extends AuthException{

  EmailExistsException(String prefix, String message) : super(prefix: prefix,message: message);

}

class ServerException extends AuthException{

  ServerException(String prefix, String message) : super(prefix: prefix,message: message);

}

class ServerNotRespondingException extends AuthException{

  ServerNotRespondingException() : super(prefix:'Server Not Responding',message: 'Server not responding try again' );

}