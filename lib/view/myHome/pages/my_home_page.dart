import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/myHome/components/my_home_setting_part.dart';
import 'package:shortstoryking3/view/myHome/sub/edit_my_profile.dart';
import 'package:shortstoryking3/view/myHome/sub/my_profile.dart';
import 'package:shortstoryking3/view_models/profile_view_model.dart';

class MyHomePage extends StatelessWidget {
  final PersistentTabController persistentTabController;

  MyHomePage({required this.persistentTabController});

  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();
    final currentUser = profileViewModel.currentUser;
    final ScrollController _scrollController = ScrollController();
    MyHomeMode myHomeMode = MyHomeMode.NORMAL_PROFILE;

    return Consumer<ProfileViewModel>(builder: (context, model, child) {
      myHomeMode = model.myHomeMode;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: (myHomeMode == MyHomeMode.EDIT_PROFILE)
              ? Text(
                  "ただ今編集中！　${model.currentUser.inAppUserName}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )
              : Text(
                  "${currentUser.inAppUserName}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
          actions: [
            MyHomeSettingPart(
                profileViewModel: profileViewModel,
                currentUser: currentUser,
                myHomeMode: myHomeMode,
                persistentTabController: persistentTabController,
                scrollController: _scrollController)
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: () {
            if (myHomeMode == MyHomeMode.EDIT_PROFILE) {
              return EditMyProfile(
                scrollController: _scrollController,
                // isFinishEditProfile: model.isFinishEditProfile,
              );
            } else if (myHomeMode == MyHomeMode.NORMAL_PROFILE) {
              return MyProfile(
                scrollController: _scrollController,
                persistentTabController: persistentTabController,
              );
            }
          }(),
        ),
      );
    });
  }
}
