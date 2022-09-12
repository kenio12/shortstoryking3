import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/view/login/screens/login_screen.dart';
import 'package:shortstoryking3/view_models/profile_view_model.dart';

class ProfileSettingPart extends StatelessWidget {
  final ProfileViewModel profileViewModel;
  final User currentUser;

  ProfileSettingPart({
    required this.profileViewModel,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: FaIcon(
        FontAwesomeIcons.bars,
        color: Colors.black,
        size: 20.0,
      ),
      onSelected: (value) => _onPopupMenuSelected(value,context),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "SIGN_OUT",
            child: Text("ログアウト"),
          )
        ];
      },
    );
  }

  _onPopupMenuSelected(value,BuildContext context) async {
    print("きてる？");
    await profileViewModel.signOut();
    Navigator.of(context,rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_)=> LoginScreen()),
            (_) => false);

    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(
    //     builder: (context) => LoginScreen(),),
    // );


    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //     builder: (context) {
    //       return LoginScreen();}), (route) {
    //       return false;
    //     });
    Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
            builder: (context) => LoginScreen()),
            (_) => false);
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => LoginScreen(),
    //   ),
    // );
    // final ProfileViewModel Login
  }
//TODO
}
