import 'package:e_connect_app/controllers/login_controller.dart';
import 'package:e_connect_app/pages/bottom_navigator_page.dart';
import 'package:e_connect_app/pages/drawer_page.dart';
import 'package:e_connect_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  LoginController controller = Get.put(LoginController());

  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();

    return Scaffold(
      appBar: appbarWidget(context),
      body: Center(
        child: Text(box.read('access_token')),
      ),
      bottomNavigationBar: bottomNavigatorPage(setCurrentIndex, currentIndex),
      drawer: drawerPage(context),
    );
  }
}
