import 'package:flutter/material.dart';

class HomeBottomNavBarItem extends BottomNavigationBarItem {
  HomeBottomNavBarItem({
    required String label,
    required String activeAsset,
    required String inactiveAsset,
    double iconWidth = 18,
    double iconHeight = 18,
    double marginTop = 20,
  }) : super(
         icon: Container(
           margin: EdgeInsets.only(top: marginTop, bottom: 5),
           width: iconWidth,
           height: iconHeight,
           child: Image.asset(inactiveAsset),
         ),
         activeIcon: Container(
           margin: EdgeInsets.only(top: marginTop, bottom: 5),
           width: iconWidth,
           height: iconHeight,
           child: Image.asset(activeAsset),
         ),
         label: label,
       );
}
