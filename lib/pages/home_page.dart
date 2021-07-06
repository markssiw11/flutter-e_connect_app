import 'package:e_connect_app/pages/bottom_navigator_page.dart';
import 'package:e_connect_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(context),
      bottomNavigationBar: bottomNavigatorPage(setCurrentIndex,
          currentIndex), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
