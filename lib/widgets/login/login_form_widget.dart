import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String passWord = '';
  @override
  Widget build(BuildContext context) {
    return Container(
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
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 2, blurRadius: 3.0),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
