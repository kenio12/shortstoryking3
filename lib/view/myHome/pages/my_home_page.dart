import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shortstoryking3/view/myHome/components/profile_setting_part.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        shadowColor: Colors.white,
        backgroundColor: Colors.white24,
        centerTitle: true,
        actions: [
        ProfileSettingPart()
        ],

      ),
      body: Center(
        child: Text("私の家ページ"),
      ),
    );
  }
}
