import 'package:flutter/material.dart';


Widget titleWidget(BuildContext context) {
  double paddingTop = MediaQuery.of(context).size.height / 5;

  return Container(
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3 + 20,
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
            SizedBox(height: 20,),
            Text(
              "E-Connect",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),

            Text(
              "Employee Connect & Request",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20,),

          ],
        )
      ],
    ),
  );
}
