
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function() onPress;
  const LoginButton({Key? key, required this.onPress}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF17ead9),
                  Color(0xFF6078ea),
                ]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {onPress();},
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0),
                    ),
                  ),
                ),
              )),
        )
      ],
    );
  }
}
