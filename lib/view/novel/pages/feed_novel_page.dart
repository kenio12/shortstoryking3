import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/novel/pages/sub/feed_novel_sub_page.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';
import 'package:shortstoryking3/view_models/login_view_model.dart';

class FeedNovelPage extends StatelessWidget {
  final PersistentTabController persistentTabController;

  FeedNovelPage({required this.persistentTabController});

  @override
  Widget build(BuildContext context) {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    final currentUser = feedNovelViewModel.currentUser;

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.2,
      //   shadowColor: Colors.white,
      //   backgroundColor: Colors.white24,
      //   centerTitle: true,
      //   title: Text(
      //     "俺は${currentUser.inAppUserName}:全ての小説",
      //     style: TextStyle(color: Colors.black, fontFamily: NovelSararaBFont),
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          color: Colors.black12,
          child: FeedNovelSubPage(
            feedNovelMode: FeedNovelMode.ALL_NOVELS,
            persistentTabController: persistentTabController,
          ),
        ),
      ),
    );
  }
}
