import 'package:flutter/material.dart';

class TabBarNavigatorPages extends StatefulWidget {
  const TabBarNavigatorPages({Key? key}) : super(key: key);

  @override
  _TabBarNavigatorPagesState createState() => _TabBarNavigatorPagesState();
}

class _TabBarNavigatorPagesState extends State<TabBarNavigatorPages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorWeight: 3,
            indicatorColor: Colors.amber,
            tabs: [
              Tab(icon: Icon(Icons.flight)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_car)),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),

          ],
        ),
      ),
    );
  }
}
