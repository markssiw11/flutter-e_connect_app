import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
AppBar appbarWidget(BuildContext context, String? name) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.orange[400],
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    toolbarHeight: 100,
    flexibleSpace: _BuildTitleWidget(name: name ?? ''),
    automaticallyImplyLeading: false,
    actions: <Widget>[],
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

Widget _buildTitleWidgets(BuildContext context) {
  var appHeight = MediaQuery.of(context).padding.top;

  double boxHeight = appHeight > 20 ? 50.0 : 25.0;
  return Container(
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: boxHeight,
                width: 50,
              ),
              Text(
                "Hello Taylor,",
                style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Let’s enjoy your day",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                "Mỗi ngày đi làm là một ngày vui",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        new Positioned(
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
              color: Colors.white38,
              shape: BoxShape.circle,
            ),
          ),
          top: -90,
          right: -30,
        ),
        new Positioned(
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: new BoxDecoration(
              color: Colors.white38,
              shape: BoxShape.circle,
            ),
          ),
          top: 50,
          right: -30,
        ),
        new Positioned(
          child: InkWell(
            onTap: () {
              print("hello");
            },
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("assets/images/avatar.jpeg"),
              backgroundColor: Colors.cyan[100],
            ),
          ),
          top: 40,
          right: 30,
        )
      ],
    ),
  );
}

class _BuildTitleWidget extends StatelessWidget {
  final String name;
  const _BuildTitleWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appHeight = MediaQuery.of(context).padding.top;
    double boxHeight = appHeight > 20 ? 50.0 : 25.0;

    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: boxHeight,
                  width: 50,
                ),
                Text(
                  "Hello $name,",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Let’s enjoy your day",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  "Mỗi ngày đi làm là một ngày vui",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          new Positioned(
            child: Container(
              width: 200.0,
              height: 200.0,
              decoration: new BoxDecoration(
                color: Colors.white38,
                shape: BoxShape.circle,
              ),
            ),
            top: -90,
            right: -30,
          ),
          new Positioned(
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: new BoxDecoration(
                color: Colors.white38,
                shape: BoxShape.circle,
              ),
            ),
            top: 50,
            right: -30,
          ),
          new Positioned(
            child: InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/images/avatar.jpeg"),
                backgroundColor: Colors.cyan[100],
              ),
            ),
            top: 40,
            right: 30,
          )
        ],
      ),
    );
  }
}

Stack bageIcon(context, len) {
  return Stack(
    children: [
      Column(
        children: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(top: 8),
            icon: const Icon(
              CupertinoIcons.cart,
            ),
            tooltip: 'Go to the next page',
            onPressed: () {},
          )
        ],
      ),
      // if (len > 0)
      Positioned(
        top: 5,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          alignment: Alignment.center,
          child: Text(len.toString()),
        ),
      )
    ],
  );
}

class BageIcon extends StatelessWidget {
  const BageIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(top: 8),
              icon: const Icon(
                CupertinoIcons.cart,
              ),
              tooltip: 'Go to the next page',
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}
