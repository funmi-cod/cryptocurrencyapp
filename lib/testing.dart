import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'components/constants.dart';

class TabTest extends StatefulWidget {
  const TabTest({Key? key}) : super(key: key);

  @override
  _TabTestState createState() => _TabTestState();
}

class _TabTestState extends State<TabTest> {
  late PersistentTabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }



  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.chartBar),
        activeColorPrimary: kTextColor,
        inactiveColorPrimary: kSubTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.globe),
        activeColorPrimary: kTextColor,
        inactiveColorPrimary: kSubTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.bell),
        activeColorPrimary: kTextColor,
        inactiveColorPrimary: kSubTextColor,
      ),
    ];
  }

  List<Widget> _buildScreen() {
    return [
      const TabTest(),
      const TabTest(),
      const TabTest(),

    ];
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreen(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: kBgColor,
      handleAndroidBackButtonPress: true,
      stateManagement: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0? 0.0: kBottomNavigationBarHeight,
      margin: const EdgeInsets.all(0.0),
      bottomScreenMargin: 0.0,
      navBarStyle: NavBarStyle.style12,
    ),
      body: Container(
        child: Text('Hello'),
      ),
    );
  }
}
