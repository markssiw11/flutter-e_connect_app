import 'package:e_connect_app/api/api_service.dart';
import 'package:e_connect_app/model/login_model.dart';
import 'package:e_connect_app/utils/routes.dart';
import 'package:e_connect_app/widgets/checkbox_widget.dart';
import 'package:e_connect_app/widgets/login/button_login_widget.dart';
import 'package:e_connect_app/widgets/progess_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final void Function(bool isLoading) onChangeLoading;
  const LoginForm({Key? key, required this.onChangeLoading}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late LoginRequestModel requestModel;
  String userName = '';
  String passWord = '';
  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel(email: userName, password: passWord);
  }

  void moveToHome(BuildContext context) async {
    if (isValidForm()) {
      _formKey.currentState!.save();
      widget.onChangeLoading(true);
      APIService apiService = new APIService();
      apiService.login(requestModel).then((value) => {
            widget.onChangeLoading(false),
            if (value.token!.isNotEmpty)
              {Navigator.pushNamed(context, MyRoutes.homeRoute)}
          });
    }
  }

  bool isValidForm() {
    return _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          spreadRadius: 2,
                          blurRadius: 3.0),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: .6,
                            fontSize: 25),
                      ),
                      TextFormField(
                        initialValue: userName,
                        autocorrect: false,
                        decoration: InputDecoration(
                            labelText: 'UserName',
                            labelStyle: TextStyle(
                              fontSize: 12,
                            ),
                            hintText: "Enter user name here",
                            hintStyle: TextStyle(height: 2)),
                        onChanged: (value) {
                          setState(() {
                            userName = value;
                          });
                        },
                        onSaved: (input) => {
                          if (input!.isNotEmpty) {requestModel.email = input}
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        autocorrect: false,
                        initialValue: passWord,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            // suffixIcon: Icon(Icons.check),
                            labelStyle: TextStyle(fontSize: 12),
                            hintText: "Enter password here"),
                        onChanged: (value) {
                          setState(() {
                            passWord = value;
                          });
                        },
                        onSaved: (input) => {
                          if (input!.isNotEmpty) {requestModel.password = input}
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CheckBoxWidget(title: 'Rememberme'),
                          Text(
                            "Forgot password?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.orange),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: LoginButton(
                    onPress: () => moveToHome(context),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
