import 'package:e_connect_app/utils/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AutoLoginController extends GetxController {
  final box = GetStorage();
  bool get isLogin => (box.read('access_token') != null);
  String get accessToken => box.read('access_token');
  String get currentPage => isLogin ? MyRoutes.homeRoute : MyRoutes.loginRoute;
  // String get currentPage => './home';
  void logout() => box.write('access_token', null);

}
