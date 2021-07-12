import 'package:e_connect_app/widgets/login/login_form_widget.dart';
import 'package:e_connect_app/widgets/login/login_title_widget.dart';
import 'package:e_connect_app/widgets/progess_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: _loginContext(context), inAsyncCall: isLoading, opacity: 0.3);
  }
  void onChangeLoading( bool value ) {
    setState(() {
      isLoading= value;
    });
  }

  Widget _loginContext(BuildContext context) {
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
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    titleWidget(context),
                    LoginForm(
                      onChangeLoading: (bool value) => onChangeLoading(value)
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          )),
    ),

    );
  }
}
