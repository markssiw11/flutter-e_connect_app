import 'package:flutter/material.dart';

class ProgressHUD extends StatelessWidget {

  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  const ProgressHUD({
    Key? key,
    required this.child,
    required this.inAsyncCall,
    required this.opacity,
    this.color = Colors.green,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
           new Center(
             child: Container(
               child: new CircularProgressIndicator( color: Colors.green,),
             ),
           ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
