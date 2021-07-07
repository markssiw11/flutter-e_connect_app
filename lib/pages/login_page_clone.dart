import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 210),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/loginImage.png"),
                    fit: BoxFit.fitHeight)),
          ),
        ),
        titleWidget(context),
        LoginForm()
      ],
    ));
  }
}

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
                children: [
                  TextFormField(
                    initialValue: userName,
                    decoration: InputDecoration(
                        labelText: 'UserName',
                        labelStyle: TextStyle(fontSize: 12,),
                        hintText: "Enter user name here",
                        hintStyle: TextStyle(height: 2)
                        ),
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

Widget titleWidget(BuildContext context) {
  double paddingTop = MediaQuery.of(context).size.height / 5;

  return Container(
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: paddingTop,
            ),
            Icon(
              Icons.supervisor_account_rounded,
              size: 36,
              color: Colors.orange,
            ),
            Text(
              "E-Connect",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Employee Connect & Request",
              style: TextStyle(fontWeight: FontWeight.w300),
            )
          ],
        )
      ],
    ),
  );
}
