import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/novel/components/feed_novel_tile.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';

class FeedNovelSubPage extends StatelessWidget {
  final FeedNovelMode feedNovelMode;

  FeedNovelSubPage({required this.feedNovelMode});

  @override
  Widget build(BuildContext context) {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    Future(() => feedNovelViewModel.getNovels(feedNovelMode));

    return Consumer<FeedNovelViewModel>(builder: (context, model, child) {
      if (model.isProcessing) {
        print("くるくる");
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        // ぐるぐるになるので、諦めた
        // model.getNovels2(feedNovelMode);

        //これも使ったが、うまくいかない
        // return FutureBuilder(
        //     future: model.getNovels(feedNovelMode),
        //     builder: (context, AsyncSnapshot<void> snapshot) {
        return (model.novels == null)
            ? Container()
            : RefreshIndicator(
                onRefresh: () => model.getNovels(feedNovelMode),
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: model.novels!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white70,
                        child: FutureBuilder(
                          future: model
                              .getNovelUserInfo(model.novels?[index].userId),
                          builder: (context, AsyncSnapshot<User> snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              final novelUser = snapshot.data!;
                              final currentUser = model.currentUser;
                              // final DateFormat outputDateTime =
                              // DateFormat('yyyy年MM月dd日');
                              // String date = outputDateTime.format(
                              //     model.novels?[index].postDateTime
                              // );
                              final String? year = model
                                  .novels?[index].postDateTime.year
                                  .toString();
                              final String? month = model
                                  .novels?[index].postDateTime.month
                                  .toString();
                              final String? day = model
                                  .novels?[index].postDateTime.day
                                  .toString();
                              final String? hour = model
                                  .novels?[index].postDateTime.hour
                                  .toString();
                              final String? minute = model
                                  .novels?[index].postDateTime.minute
                                  .toString();
                              final String? second = model
                                  .novels?[index].postDateTime.second
                                  .toString();

                              //model.novels?[index].postDateTime
                              return ListTile(
                                // dense: true,
                                title: Text(
                                  "${model.novels?[index].title}",
                                  style: TextStyle(
                                      fontFamily: NovelSararaBFont,
                                      fontSize: 20),
                                ),
                                subtitle: Text(
                                  "${year}年"
                                  "${month}月"
                                      "${day}日"
                                      " ${hour}:"
                                      "${minute}:"
                                      "${second}"

                                  "\n${novelUser.inAppUserName}",
                                  style: TextStyle(
                                      fontFamily: NovelSararaRFont,
                                      color: Colors.black,
                                      fontSize: 19),
                                ),
                                tileColor: Colors.white10,
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    );

                    FeedNovelTile(
                      feedNovelMode: feedNovelMode,
                      novel: model.novels![index],
                    );
                  },
                ),
              );
      }
    });
  }
}
