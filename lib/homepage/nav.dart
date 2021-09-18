import 'package:ezopurse/coin/buy_coin.dart';
import 'package:ezopurse/coin/receive_coin.dart';
import 'package:ezopurse/coin/send_coin.dart';
import 'package:ezopurse/coin/transactions.dart';
import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/home.dart';
import 'package:ezopurse/homepage/market.dart';
import 'package:ezopurse/homepage/portfolio.dart';
import 'package:ezopurse/homepage/profiile.dart';
import 'package:ezopurse/homepage/trade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  // static const color = const Color(0xFF184C35);
  static const color  = kPrimaryColor;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Trade(),
    Transaction(),
    SendCoin(),
    ReceiveCoin(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


@override
  Widget build(BuildContext context) {
    final String assetName = 'images/vector1.svg';
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: 'Trade',
            backgroundColor: color,
            icon: SvgPicture.asset('images/vector1.svg'),
            // icon: ImageIcon(AssetImage('images/trade.png'))
          ),
          BottomNavigationBarItem(
           icon: ImageIcon(AssetImage('images/ve.png')),
           label: 'Transaction',
           backgroundColor: color,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/up.png')),
            label: 'Send',
            backgroundColor: color,
          ),
           BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/down.png')),
            label: 'Receive',
            backgroundColor: color,
          ),
           BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/vector8.png')),
            label: 'Profile',
            backgroundColor: color,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: kPColor,
        currentIndex: _selectedIndex,
        selectedItemColor: color,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        iconSize: 30,
        // elevation: 30,
      ),
    );
  }
}