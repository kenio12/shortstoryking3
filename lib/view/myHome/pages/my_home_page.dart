import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/view/myHome/components/my_home_setting_part.dart';
import 'package:shortstoryking3/view/myHome/components/my_profile_detail.dart';
import 'package:shortstoryking3/view/myHome/components/my_profile_image.dart';
import 'package:shortstoryking3/view/myHome/components/stateful_my_profile_image_detail.dart';
import 'package:shortstoryking3/view_models/profile_view_model.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();
    final currentUser = profileViewModel.currentUser;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "${currentUser.inAppUserName}",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          MyHomeSettingPart(
            profileViewModel: profileViewModel,
            currentUser: currentUser,
          )
        ],
      ),
      body: Column(
        children: [
          StatefulMyProfileImageDetail(),
        // MyProfileImage(),
        // MyProfileDetail(),
      ],)
    );
  }
}
