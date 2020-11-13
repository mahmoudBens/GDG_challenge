
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdg_mahmoud_bensfia/Config/Constants.dart';
import 'package:gdg_mahmoud_bensfia/Routes/HomeScreen.dart';

import 'Bag.dart';
import 'account.dart';
import 'cart.dart';

class Navigation extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  => HomePageState();
}


class HomePageState extends State<Navigation> {
  int _currentTab=0;
  List<Widget> _children=[HomeScreen(),Cart(),Bag(),Account(),Account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE7EBEE),
      body: SafeArea(
        child: _children[_currentTab],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          boxShadow: [BoxShadow(
            offset: Offset(0,-3),
            color: Colors.grey[300],
            blurRadius: 2,
          )]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          child: BottomNavigationBar(
            iconSize: 20,
              selectedItemColor: Constants.orange,
              unselectedItemColor: Constants.grey1,
              type: BottomNavigationBarType.shifting,
              onTap: (int value) {
                setState(() {
                  _currentTab=value;
                });
              },
              currentIndex: _currentTab,
              items:[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/Buttom bar icons/ic_home_icon.svg"),
                  title: dotTitle()
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/Buttom bar icons/ic_cart_icon.svg"),
                  title: dotTitle(),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/Buttom bar icons/ic_plus_icon.svg"),
                  title: dotTitle(),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/Buttom bar icons/ic_bag_icon.svg"),
                  title:dotTitle(),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/Buttom bar icons/ic_account_icon.svg"),
                  title: dotTitle(),
                )
              ]
          ),
        ),
      ),
    );
  }

  Widget dotTitle() {
    return SizedBox(height: 0,width: 0,);
  }
}


