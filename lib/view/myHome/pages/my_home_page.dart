import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/myHome/components/my_home_setting_part.dart';
import 'package:shortstoryking3/view/myHome/sub/edit_my_profile.dart';
import 'package:shortstoryking3/view/myHome/sub/my_profile.dart';
import 'package:shortstoryking3/view_models/profile_view_model.dart';

class MyHomePage extends StatelessWidget {
  final MyHomeMode myHomeMode;

  MyHomePage({required this.myHomeMode});

  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();
    final currentUser = profileViewModel.currentUser;
    final ScrollController _scrollController = ScrollController();

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
      body: SingleChildScrollView(
        controller: _scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: () { if (myHomeMode == MyHomeMode.EDIT_PROFILE) {
          return EditMyProfile(
              scrollController: _scrollController);
        } else if ( myHomeMode == MyHomeMode.NORMAL_PROFILE) {
          return MyProfile(scrollController: _scrollController);
          }
        }(),
    ),
    );
}
}