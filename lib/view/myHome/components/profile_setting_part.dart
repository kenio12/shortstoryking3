import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileSettingPart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: FaIcon(FontAwesomeIcons.bars),
    onSelected: (context) => _onPopupMenuSelected(),
    itemBuilder: (context){
      return [
        PopupMenuItem(
      child: Text("ログアウト"),
      )
      ];
},);
  }
  //TODO
  _onPopupMenuSelected(){}
}
