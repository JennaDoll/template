import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_secret_menu/tabs/calendar_tab.dart';
import 'package:starbucks_secret_menu/tabs/web_view_container.dart';

import '../config.dart';
import '../services/theme_changer.dart';
import '../tabs/categories_tab.dart';
import '../tabs/home_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  get url => "http://starbucks.social-goat.com/";
//added below for fb
  @override
  void initState() {
    FacebookAudienceNetwork.init(
    testingId: "b9f2908b-1a6b-4a5b-b862-ded7ce289e41",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
     /* appBar: AppBar(
        title: Text("Secret Menu & Social Network"),
        titleSpacing: 8.0,
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.lightbulb_outline),
            onTap: themeChanger.toggle,
          )
        ],
      ),*/

      body: Stack(
        children: [
          Container(
            child: IndexedStack(
              index: currentIndex,
              children: <Widget>[
                HomeTab(),
                Calendar(),
                CategoriesTab(),
                WebViewContainer(url),

              ],

            ),
          ),

          Container(
             child:
             Positioned (
               bottom: 0,
               left:50,


               child: FacebookBannerAd(
                bannerSize: BannerSize.STANDARD,
                keepAlive: true,
                placementId: "1347549032304210_1348086808917099",

              ),



             ),
          )
        ],
          ),











      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list),
            title: Text('Featured Drinks'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_sharp),
            title: Text('Record Visits'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Browse Secret Menu'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home Menu'),
          ),
        ],


      ),


    );
  }
}




/*
fb banner

Column(
children: [
FacebookBannerAd(
bannerSize: BannerSize.STANDARD,
keepAlive: true,
placementId: "1347549032304210_1347550045637442",
)
],
)*/
