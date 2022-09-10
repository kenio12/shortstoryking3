import 'package:flutter/material.dart';

class ProfileSettingPart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.settings),
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
  _onPopupMenuSelected() async{
      final ProfileSettingModel
  }
}
