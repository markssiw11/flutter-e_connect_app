import 'package:e_connect_app/widgets/login/login_form_widget.dart';
import 'package:e_connect_app/widgets/login/login_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    void initState() {
   FocusScope.of(context).unfocus();
   super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/loginBg.png"),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft)),
            child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      titleWidget(context), 
                      LoginForm()
                      ],
                  ),
          ),
        ],
      )),
      )
    );
  }
}
