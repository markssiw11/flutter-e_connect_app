import 'package:e_connect_app/pages/bottom_navigator_page.dart';
import 'package:e_connect_app/pages/home_page.dart';
import 'package:e_connect_app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      // home: HomePage()
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  // TabController controller=TabController(length: 2, vsync: this);

  void setCurrentIndex( int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times: $currentIndex',
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigatorPage(setCurrentIndex, currentIndex), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
