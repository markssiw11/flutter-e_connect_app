import 'package:e_connect_app/controllers/auto_login_controller.dart';
import 'package:e_connect_app/model/login_model.dart';
import 'package:e_connect_app/utils/routes.dart';
import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

Drawer drawerPage(BuildContext context) {
  final double bottomPadding = MediaQuery.of(context).padding.bottom;
  final controller = Get.put(AutoLoginController());
  LoginResponseModel? profileData = controller.getProfile;
  ProfileUserItem? profileUser = profileData!.profileUser;
  return Drawer(
    child: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            children: [
              Container(
                color: Colors.orange[400],
                child: Row(
                  children: [
                    DrawerHeader(
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage("assets/images/avatar.jpeg"),
                        backgroundColor: Colors.cyan[100],
                      ),
                      // decoration: BoxDecoration(
                      //   color: Colors.blue,
                      // ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${profileUser!.firstName} ${profileUser.lastName}',
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                  ],
                ),
              ),
              buildMenuItem(name: 'user', icon: Icons.verified_user, onTap: ()=>{}),
              buildMenuItem(name: 'settings', icon: Icons.settings, onTap: ()=>{}),
            ],
          )),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomLeft,
              child: buildMenuItem(
                  name: 'logout',
                  icon: Icons.exit_to_app,
                  onTap: () => {
                        controller.logout(),
                        Navigator.pushNamed(context, MyRoutes.loginRoute),
                      }),
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

Widget buildMenuItem({
  required String name,
  required IconData icon,
  required void Function() onTap,
  // required this.onPress
}) {
  return Card(
    color: Colors.grey[100],
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 16, color: Colors.blue),
      ),
      onTap: () {
        onTap();
      },
    ),
  );
}
