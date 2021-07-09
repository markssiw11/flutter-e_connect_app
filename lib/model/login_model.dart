import 'dart:convert';

class LoginRequestModel {
  String email;
  String password;
  LoginRequestModel({
     required this.email,
     required this.password,
  });
  

  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email.trim(),
      'password': password.trim(),
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) => LoginRequestModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginRequestModel(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginRequestModel &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
class LoginResponseModel {
  final String? token;
  final String? error;
  LoginResponseModel({
     this.token,
     this.error,
  });
  

  LoginResponseModel copyWith({
    String? token,
    String? error,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'error': error,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'],
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) => LoginResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginResponseModel(token: $token, error: $error)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginResponseModel &&
      other.token == token &&
      other.error == error;
  }

  @override
  int get hashCode => token.hashCode ^ error.hashCode;
}
