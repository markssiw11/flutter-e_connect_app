import 'package:e_connect_app/controllers/auto_login_controller.dart';
import 'package:e_connect_app/model/login_model.dart';
import 'package:e_connect_app/pages/bottom_navigator_page.dart';
import 'package:e_connect_app/pages/drawer_page.dart';
import 'package:e_connect_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late AutoLoginController controller;

  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    controller = Get.put(AutoLoginController());
  }
  @override
  
  Widget build(BuildContext context) {
    LoginResponseModel? response = controller.getProfile;
    String? lastName = response!.profileUser!.lastName;
    return Scaffold(
      appBar: appbarWidget(context, lastName.toString() ),
      body: Center(
        child: Text(controller.getRemember.toString()),
      ),
      bottomNavigationBar: bottomNavigatorPage(setCurrentIndex, currentIndex),
      drawer: drawerPage(context),
    );
  }
}
