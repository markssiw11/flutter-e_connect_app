import 'package:e_connect_app/api/api_service.dart';
import 'package:e_connect_app/controllers/auto_login_controller.dart';
import 'package:e_connect_app/pages/home_page.dart';
import 'package:e_connect_app/pages/login_page.dart';
import 'package:e_connect_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return App();
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late AutoLoginController controller;
  String? refreshToken;
  String initPage = MyRoutes.loginRoute;
  @override
  void initState() {
    super.initState();
    controller = Get.put(AutoLoginController());
    refreshToken = controller.getRefreshToken ?? null;
    initPage = controller.currentPage;
    if (refreshToken != null && controller.isLogin) {
      APIService apiService = new APIService();
      print('refresh token $refreshToken');
      apiService.refreshToken(refreshToken).then((value) => {
            if (value != '0')
              {
                controller.logout(),
                initPage = MyRoutes.loginRoute
              }
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: controller.currentPage,
        routes: {
          '/': (context) => LoginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
        });
  }
}
