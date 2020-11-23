import 'package:baymax/Component/config.dart';
import 'package:baymax/Component/fab_bottom_app_bar.dart';
import 'package:baymax/Pages/Agenda/agenda.dart';
import 'package:baymax/Pages/Doctor/doctor.dart';
import 'package:baymax/Pages/home.dart';
import 'package:baymax/Pages/page4.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  final String title = "hola";

  @override
  _MainPage createState() => new _MainPage();
}

class _MainPage extends State<MainPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Doctor(),
    Agenda(),
    Page4(),
  ];

  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Tarjeta',
        color: Color(0xff000000),
        backgroundColor: Color(0xffB9B6B6),
        selectedColor: Colors.blue,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.userAlt, text: 'Perfil'),
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.userMd, text: 'Doctor'),
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.solidCalendarAlt, text: 'Agemda'),
          FABBottomAppBarItem(iconData: FontAwesomeIcons.cog, text: 'Ajustes'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return Page5();
          //     },
          //   ),
          // );
          currentTheme.switchTheme();
        },
        tooltip: 'Tarjeta',
        backgroundColor: Colors.blue,
        child: FaIcon(
          FontAwesomeIcons.qrcode,
          color: Color(0xFFffffff),
        ),
        elevation: 2.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
