import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
CurvedNavigationBar bottomNavigatorPage(void Function(int) onPress, int _selectedIndex) {
  Color _colorIcon = Colors.white;
  return CurvedNavigationBar(
    backgroundColor: Colors.white,
    color: getBottomBarColor(_selectedIndex),
    buttonBackgroundColor: Colors.blueGrey,
    items: <Widget>[
      Icon(Icons.home, size: 30, color: _colorIcon,),
      Icon(Icons.list, size: 30, color: _colorIcon),
      Icon(Icons.compare_arrows, size: 30, color: _colorIcon),
    ],
    onTap: (index) {
      //Handle button tap
      onPress(index);
    },
  );
}

Color getBottomBarColor (_selectedIndex) {
  switch (_selectedIndex) {
    case 0:
      return Colors.orange;
    case 1:
      return Colors.green;
     case 2:
      return Colors.blue;
    default:
    return Colors.orange;
  }
}