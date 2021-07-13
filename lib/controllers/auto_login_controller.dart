import 'package:e_connect_app/model/login_model.dart';
import 'package:e_connect_app/utils/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AutoLoginController extends GetxController {
  final box = GetStorage();
  String userName = '';
  //token
  void setAccessToken (String token) => box.write('accessToken', token);
  String get getAccessToken => box.read('accessToken') ?? '';
  //user Name
  void setUserName(String user) => box.write('userName', user);
  String get getUserName => box.read('userName') ?? '';
  // remember me
  void setRemember(bool data) => box.write('remember', data);
  bool get getRemember  => box.read('remember') ?? false;
  // profile data
  void setProfile(data) => {box.write('profile', data)};
  String get profileJson => box.read('profile');
  LoginResponseModel? get getProfile => LoginResponseModel.fromJson(profileJson);

  // refresh token
  void setRefreshToken(String? data) => box.write('refresh_token', data);
  String? get getRefreshToken => box.read('refresh_token');

  // current page
  bool get isLogin => getRefreshToken != null;
  String get currentPage => isLogin ? MyRoutes.homeRoute : MyRoutes.loginRoute;

  void logout() => {
        box.write('refresh_token', null),
        if (!getRemember) {box.write('userName', '')}
      };
}
