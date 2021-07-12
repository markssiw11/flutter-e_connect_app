import 'package:e_connect_app/controllers/auto_login_controller.dart';
import 'package:e_connect_app/utils/routes.dart';
import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

Drawer drawerPage(BuildContext context) {
  final double bottomPadding = MediaQuery.of(context).padding.bottom;
  final controller = Get.put(AutoLoginController());

  return Drawer(
    child: Container(
      decoration: BoxDecoration(color: Color(0xFF0098c2)),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('logout'),
                onTap: () {
                  controller.logout();
                },
              ),
            ],
          )),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomLeft,
              child: Card(
                child: ListTile(
                  title: Text('logout'),
                  onTap: () {
                    controller.logout();
                    Navigator.pushNamed(context, MyRoutes.loginRoute);
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: bottomPadding,
          )
        ],
      ),
    ),
  );
}
