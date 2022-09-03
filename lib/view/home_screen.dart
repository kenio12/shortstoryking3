import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shortstoryking3/styles/battle2_icons.dart';
import 'package:shortstoryking3/styles/writer_icons.dart';
import 'package:shortstoryking3/view/battle/pages/battle_page.dart';
import 'package:shortstoryking3/view/myHome/pages/my_home_page.dart';
import 'package:shortstoryking3/view/novel/pages/feed_novel_page.dart';
import 'package:shortstoryking3/view/writer/pages/writer_page.dart';
import 'package:shortstoryking3/view/writing/pages/writing_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages = [];
  PersistentTabController persistentTabController = PersistentTabController();

  @override
  void initState() {
    _pages = [
      MyHomePage(),
      FeedNovelPage(),
      WriterPage(),
      WritingPage(persistentTabController: persistentTabController),
      BattlePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        hideNavigationBarWhenKeyboardShows: false,
        screens: _pages,
        controller: persistentTabController,
        items: [
          PersistentBottomNavBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            title: "お家",
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: FaIcon(FontAwesomeIcons.bookOpen),
            title: "読む",
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Writer.writer),
            title: "作家",
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(FontAwesomeIcons.featherAlt),
            title: "書く",
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Battle2.battle2),
            title: "戦い",
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.grey,
          ),
        ],
      ),
    );
  }
}
