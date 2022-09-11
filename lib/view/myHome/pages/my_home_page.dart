import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/view/myHome/components/profile_setting_part.dart';
import 'package:shortstoryking3/view_models/profile_view_model.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();
    final currentUser = profileViewModel.currentUser;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        shadowColor: Colors.white,
        backgroundColor: Colors.white24,
        centerTitle: true,
        title: Text(
          "${currentUser.inAppUserName}　の部屋",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          ProfileSettingPart(
            profileViewModel: profileViewModel,
            currentUser: currentUser,
          )
        ],
      ),
      body: Center(
        child: Text("私の家ページ"),
      ),
    );
  }
}
