import 'dart:convert';

class LoginRequestModel {
  String phoneNumber;
  String password;
  LoginRequestModel({
     required this.phoneNumber,
     required this.password,
  });
  

  LoginRequestModel copyWith({
    String? phoneNumber,
    String? password,
  }) {
    return LoginRequestModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      phoneNumber: map['phoneNumber'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) => LoginRequestModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginRequestModel(phoneNumber: $phoneNumber, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginRequestModel &&
      other.phoneNumber == phoneNumber &&
      other.password == password;
  }

  @override
  int get hashCode => phoneNumber.hashCode ^ password.hashCode;
}


class LoginResponseModel {
  String? access_token;
  String? expired_time;
  int? expires_in;
  String? refresh_token;
  ProfileUserItem ? profileUser;
  String? name;
  String? message;
  LoginResponseModel({
    this.access_token,
    this.expired_time,
    this.expires_in,
    this.refresh_token,
    this.profileUser,
    this.name,
    this.message,
  });


  LoginResponseModel copyWith({
    String? access_token,
    String? expired_time,
    int? expires_in,
    String? refresh_token,
    ProfileUserItem ? profileUser,
    String? name,
    String? message,
  }) {
    return LoginResponseModel(
      access_token: access_token ?? this.access_token,
      expired_time: expired_time ?? this.expired_time,
      expires_in: expires_in ?? this.expires_in,
      refresh_token: refresh_token ?? this.refresh_token,
      profileUser: profileUser ?? this.profileUser,
      name: name ?? this.name,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': access_token,
      'expired_time': expired_time,
      'expires_in': expires_in,
      'refresh_token': refresh_token,
      'profileUser': profileUser?.toMap(),
      'name': name,
      'message': message,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      access_token: map['access_token'],
      expired_time: map['expired_time'],
      expires_in: map['expires_in'],
      refresh_token: map['refresh_token'],
      profileUser: ProfileUserItem .fromMap(map['profileUser']),
      name: map['name'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) => LoginResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginResponseModel(access_token: $access_token, expired_time: $expired_time, expires_in: $expires_in, refresh_token: $refresh_token, profileUser: $profileUser, name: $name, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginResponseModel &&
      other.access_token == access_token &&
      other.expired_time == expired_time &&
      other.expires_in == expires_in &&
      other.refresh_token == refresh_token &&
      other.profileUser == profileUser &&
      other.name == name &&
      other.message == message;
  }

  @override
  int get hashCode {
    return access_token.hashCode ^
      expired_time.hashCode ^
      expires_in.hashCode ^
      refresh_token.hashCode ^
      profileUser.hashCode ^
      name.hashCode ^
      message.hashCode;
  }
}

class ProfileUserItem {
  final String id;
  final String firstName;
  final String lastName;
  final String birthDay;
  final String phoneNumber;
  final String email;
  final String province;
  final String district;
  ProfileUserItem({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDay,
    required this.phoneNumber,
    required this.email,
    required this.province,
    required this.district,
  });

  ProfileUserItem copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? birthDay,
    String? phoneNumber,
    String? email,
    String? province,
    String? district,
  }) {
    return ProfileUserItem(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDay: birthDay ?? this.birthDay,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      province: province ?? this.province,
      district: district ?? this.district,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'birthDay': birthDay,
      'phoneNumber': phoneNumber,
      'email': email,
      'province': province,
      'district': district,
    };
  }

  factory ProfileUserItem.fromMap(Map<String, dynamic> map) {
    return ProfileUserItem(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      birthDay: map['birthDay'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      province: map['province'],
      district: map['district'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileUserItem.fromJson(String source) => ProfileUserItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileUserItem(id: $id, firstName: $firstName, lastName: $lastName, birthDay: $birthDay, phoneNumber: $phoneNumber, email: $email, province: $province, district: $district)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProfileUserItem &&
      other.id == id &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.birthDay == birthDay &&
      other.phoneNumber == phoneNumber &&
      other.email == email &&
      other.province == province &&
      other.district == district;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      birthDay.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      province.hashCode ^
      district.hashCode;
  }
}


class LoginResponseFailModel {
  String? name;
  String? message;
  LoginResponseFailModel({
    this.name,
    this.message,
  });

  LoginResponseFailModel copyWith({
    String? name,
    String? message,
  }) {
    return LoginResponseFailModel(
      name: name ?? this.name,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'message': message,
    };
  }

  factory LoginResponseFailModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseFailModel(
      name: map['name'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseFailModel.fromJson(String source) => LoginResponseFailModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginResponseFailModel(name: $name, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginResponseFailModel &&
      other.name == name &&
      other.message == message;
  }

  @override
  int get hashCode => name.hashCode ^ message.hashCode;
}
