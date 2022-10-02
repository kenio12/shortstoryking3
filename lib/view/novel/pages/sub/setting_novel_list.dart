import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';

class SettingNovelList extends StatelessWidget {
  final BuildContext context;
  final FeedNovelMode feedNovelMode;
  final PersistentTabController persistentTabController;
  final FeedNovelViewModel model;

  SettingNovelList(
      {required this.context,
      required this.feedNovelMode,
      required this.persistentTabController,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("dfsjifsji"),
          ElevatedButton(
            onPressed: () => _finishSettingNovelList(context),
            child: Text("設定終了",style: TextStyle(fontSize: 20),),
          )
        ],
      ),
    );
  }

  _finishSettingNovelList(BuildContext context) {
    Navigator.pop(context);
  }
}
