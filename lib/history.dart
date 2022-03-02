import 'dart:math';

import 'package:cryptocurrencyapp/circle_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'components/constants.dart';
import 'components/size_config.dart';

class History extends StatelessWidget {
  const History({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    SizeConfig().init(context);
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
        const History(),
        const History(),
        const History(),

      ];
    }
    return Scaffold(
      bottomNavigationBar: DefaultTabController(
        length: 4, child: Container(
        height: 50,
        color: kBgColor,
        child: TabBar(
          indicator: CircleIndicator(
            color: kTextColor,
            radius: 3,
          ), tabs: const [
            Tab(
              child: FaIcon(FontAwesomeIcons.chartBar,
                color: kSubTextColor,
                size: 20,
              ),
            ),
          Tab(
            child: FaIcon(FontAwesomeIcons.globe,
              color: kSubTextColor,
              size: 20,
            ),
          ),
          Tab(
            child: FaIcon(FontAwesomeIcons.bell,
              color: kSubTextColor,
              size: 20,
            ),
          ),
          Tab(
            child: FaIcon(FontAwesomeIcons.user,
              color: kSubTextColor,
              size: 20,
            ),
          ),
        ],
        ),
      ),

      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateWidth(20.0)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateWidth(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('History', style: headingStyle,),
                    SizedBox(
                      child: Row(
                        children:  [
                          Transform.rotate(
                            angle: 90 * pi / 180,
                              child: const FaIcon(FontAwesomeIcons.slidersH, color: kTextColor,),),
                          Text('  Sort/Filter', style: subTextStyle,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02,),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 16,
                    itemBuilder: (context, index){
                    return ListTile(
                      title: RichText(
                        text: TextSpan(
                          text: "received",style: subHeadingStyle,
                          children: [
                            TextSpan(text: "\nBitcoin",style: headingStyle),
                            TextSpan(text: "\n7599503", style: subHeadingStyle),
                          ],
                        ),
                      ),
                      leading: Container(
                        height: getProportionateHeight(120),
                        width: getProportionateWidth(50),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kBgColor,),
                        child: Icon(Icons.add_a_photo_sharp),
                      ),
                      trailing: Text("Crypto app", style: activeTrailStyle,),

                    );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
