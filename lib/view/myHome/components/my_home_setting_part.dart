import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/login/screens/login_screen.dart';
import 'package:shortstoryking3/view/myHome/sub/edit_my_profile.dart';
import 'package:shortstoryking3/view_models/profile_view_model.dart';

class MyHomeSettingPart extends StatelessWidget {
  final ProfileViewModel profileViewModel;
  final User currentUser;
  final MyHomeMode myHomeMode;
  final PersistentTabController persistentTabController;
  final ScrollController scrollController;

  MyHomeSettingPart({
    required this.profileViewModel,
    required this.currentUser,
    required this.myHomeMode,
    required this.persistentTabController,
    required this.scrollController
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: FaIcon(
        FontAwesomeIcons.bars,
        color: Colors.black,
        size: 20.0,
      ),
      onSelected: (MyProfileSettingMenu value) =>
          _onPopupMenuSelected(value, context),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: MyProfileSettingMenu.LOG_OUT,
            child: Text("ログアウト"),
          ),
          (myHomeMode == MyHomeMode.NORMAL_PROFILE)
              ? PopupMenuItem(
                  value: MyProfileSettingMenu.EDIT_PROFILE,
                  child: Text("プロフィールを編集画面へ"),
                )
              : PopupMenuItem(
                  value: MyProfileSettingMenu.NORMAL_PROFILE,
                  child: Text("編集を途中でやめる"),
                ),
          PopupMenuItem(
            value: MyProfileSettingMenu.FINISH_EDIT_PROFILE,
            child: Text("プロフィール編集を登録する"),
          )
        ];
      },
    );
  }

  _onPopupMenuSelected(
      MyProfileSettingMenu selectedMenu, BuildContext context) async {
    switch (selectedMenu) {
      case MyProfileSettingMenu.LOG_OUT:
        await profileViewModel.signOut();
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => LoginScreen()), (_) => false);
        break;
      case MyProfileSettingMenu.EDIT_PROFILE:
        profileViewModel.changeEditMyProfile();
        break;
      case MyProfileSettingMenu.NORMAL_PROFILE:
        profileViewModel.changeNormalMyProfile();
        break;
      case MyProfileSettingMenu.FINISH_EDIT_PROFILE:
        profileViewModel.finishEditProfile();
        break;
    }
  }
//TODO
}
