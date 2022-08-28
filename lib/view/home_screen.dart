import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shortstoryking3/styles/battle2_icons.dart';
import 'package:shortstoryking3/styles/battle_icons.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/styles/writer_icons.dart';
import 'package:shortstoryking3/view/battle/pages/battle_page.dart';
import 'package:shortstoryking3/view/myHome/pages/my_home_page.dart';
import 'package:shortstoryking3/view/novel/pages/novel_page.dart';
import 'package:shortstoryking3/view/writer/pages/writer_page.dart';
import 'package:shortstoryking3/view/writing/pages/writing_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<Widget> _pages = [];
  int _currentIndex = 0;

  //bottomBarをスクロール 上のSingleTickerProviderStateMixinもそう
  late AnimationController _animationController;
  late Animation<double> _height;

  @override
  void initState() {
    _pages = [
      NovelPage(),
      WriterPage(),
      WritingPage(),
      BattlePage(),
      MyHomePage(),
    ];

    //bottomBarをスクロール
    _animationController = AnimationController(
        //1
        vsync: this,
        //2
        duration: const Duration(milliseconds: 500),
    );
        //3
        _height = Tween<double>(begin: 0, end: 100).animate(_animationController);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        // selectedItemColor: Colors.white24,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookOpen),
            label: "小説",
          ),
          BottomNavigationBarItem(
            icon: Icon(Writer.writer),
            label: "作家",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.featherAlt),
            label: "執筆",
          ),
          BottomNavigationBarItem(
            icon: Icon(Battle2.battle2),
            label: "バトル",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseUser),
            label: "自宅",
          ),
        ],
      ),
    );
  }
}
