import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/novel/pages/sub/feed_novel_sub_page.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';
import 'package:shortstoryking3/view_models/login_view_model.dart';

class FeedNovelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    final currentUser = feedNovelViewModel.currentUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        shadowColor: Colors.white,
        backgroundColor: Colors.white24,
        centerTitle: true,
        title: Text(
          "${currentUser.inAppUserName}:全ての小説",
          style: TextStyle(color: Colors.black, fontFamily: NovelSararaBFont),
        ),
      ),
      body: Container(
        color: Colors.black26,
        child: FeedNovelSubPage(
          feedNovelMode: FeedNovelMode.ALL_NOVELS,

        ),
      ),
    );
  }
}
