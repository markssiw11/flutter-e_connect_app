import 'package:e_connect_app/api/api_service.dart';
import 'package:e_connect_app/controllers/auto_login_controller.dart';
import 'package:e_connect_app/model/login_model.dart';
import 'package:e_connect_app/utils/routes.dart';
import 'package:e_connect_app/widgets/checkbox_widget.dart';
import 'package:e_connect_app/widgets/login/button_login_widget.dart';
import 'package:e_connect_app/widgets/snack_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginForm extends StatefulWidget {
  final void Function(bool isLoading) onChangeLoading;
  const LoginForm({Key? key, required this.onChangeLoading}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late LoginRequestModel requestModel;
  late AutoLoginController controller;

  String userName = '';
  String passWord = '';
  bool isChecked = false;
  void onCheck(bool value) {
    setState(() {
      isChecked = value;
    });
  }
  @override
  void initState () {
    super.initState();
    requestModel = new LoginRequestModel(phoneNumber: userName, password: passWord);
    controller = Get.put(AutoLoginController());
    userName = controller.getUserName;
    isChecked= controller.getRemember;
  }

  void moveToHome(BuildContext context) async {
    if (isValidForm()) {
      _formKey.currentState!.save();
      widget.onChangeLoading(true);
      APIService apiService = new APIService();
      apiService.login(requestModel).then((value) => {
            widget.onChangeLoading(false),
            if (value.message != null) {
              {showSnackBar(context, value.message)}
            } else if (value.access_token != null) {
               Navigator.pushNamed(context, MyRoutes.homeRoute),
               controller.setUserName(userName),
               controller.setRemember(isChecked),
            }
            
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
                          if (input!.isNotEmpty) {requestModel.phoneNumber = input}
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
                          CheckBoxWidget(title: 'Rememberme', isCheck: isChecked, onChange: onCheck),
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
