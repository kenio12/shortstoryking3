import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shortstoryking3/data_models/novel.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/common/change_japanease_day.dart';
import 'package:shortstoryking3/view/common/conpact_change_japanease_day.dart';
import 'package:shortstoryking3/view/novel/components/feed_novel_tile.dart';
import 'package:shortstoryking3/view/novel/pages/sub/novel_detail_sub_page.dart';
import 'package:shortstoryking3/view/novel/pages/sub/read_novel.dart';
import 'package:shortstoryking3/view/novel/pages/sub/setting_novel_list.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';

class FeedNovelSubPage extends StatelessWidget {
  final FeedNovelMode feedNovelMode;
  final PersistentTabController persistentTabController;

  FeedNovelSubPage({
    required this.feedNovelMode,
    required this.persistentTabController,
  });

  @override
  Widget build(BuildContext context) {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    Future(() => feedNovelViewModel.getNovels(feedNovelMode, null));

    return Consumer<FeedNovelViewModel>(
      builder: (context, model, child) {
        // if (model.isFeedNovel) {
        if (model.isProcessing) {
          print("くるくる");
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return (model.novels == null)
              ? Container()
              : RefreshIndicator(
                  onRefresh: () => model.getNovels(feedNovelMode, null),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 18.0, bottom: 8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  _settingNovelList(context, feedNovelMode,
                                      persistentTabController);
                                },
                                child: _selectedNovelListText(
                                    model.selectedWriter,
                                    model.selectedFeedNovelMode,
                                    context)),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: 1,
                                  color: Colors.black26
                                ),
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Colors.black26
                                  )
                              )
                          ),
                          child: ScrollablePositionedList.builder(
                            initialScrollIndex: model.selectedListIndex,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: model.novels!.length,
                            itemBuilder: (context, index) {
                              final List<Novel> novels = model.novels!;
                              final Novel selectedNovel = model.novels![index];
                              return Slidable(
                                key: const ValueKey(0),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  // dismissible: DismissiblePane(
                                  //   onDismissed: () {},
                                  // ),
                                  children: const [
                                    // A SlidableAction can have an icon and/or a label.
                                    SlidableAction(
                                      onPressed: null,
                                      backgroundColor: Colors.white60,
                                      foregroundColor: Colors.black87,
                                      icon: Icons.share,
                                      label: 'シェア（知らせる）',
                                    ),
                                  ],
                                ),
                                startActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  // dismissible: DismissiblePane(
                                  //   onDismissed: () {},
                                  // ),
                                  children: const [
                                    SlidableAction(
                                      onPressed: null,
                                      backgroundColor: Colors.black87,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: '削除',
                                    ),
                                    SlidableAction(
                                      onPressed: null,
                                      backgroundColor: Colors.white60,
                                      foregroundColor: Colors.black,
                                      icon: Icons.edit,
                                      label: '編集',
                                    ),
                                    // A SlidableAction can have an icon and/or a label.
                                  ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                        // top: BorderSide(
                                        //     width: 1
                                        // ),
                                      bottom: BorderSide(
                                        width: 1,
                                          color: Colors.black26
                                      )
                                    )
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.black,
                                    onTap: () => _readNovel(
                                      selectedNovel.novelId,
                                      index,
                                      feedNovelMode,
                                      context,
                                    ),

                                    // model.changeNovelDetailSubPage(
                                    // selectedNovel.novelId, index,feedNovelMode),
                                    child: FutureBuilder(
                                      future: model
                                          .getNovelUserInfo(selectedNovel.userId),
                                      builder: (context,
                                          AsyncSnapshot<User> snapshot) {
                                        if (snapshot.hasData &&
                                            snapshot.data != null) {
                                          final selectedNovelUser =
                                              snapshot.data!;
                                          final currentUser = model.currentUser;

                                          //model.novels?[index].postDateTime
                                          child:
                                          return Row(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0, top: 10.0),
                                                  child: Image.asset(
                                                    selectedNovelUser
                                                        .inAppUserImage,
                                                    fit: BoxFit.contain,
                                                    width: 120,
                                                    height: 120,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  width: 2,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 10,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      child: Text(
                                                        "${selectedNovel.title}",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              NovelSararaBFont,
                                                          fontSize: 25,
                                                        ),
                                                        overflow:
                                                            TextOverflow.fade,
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      child: ConpactChangeJapaneaseDay(
                                                          postDateTime:
                                                              selectedNovel
                                                                  .postDateTime),
                                                    ),
                                                    //           Text(

                                                    Container(
                                                      width: double.infinity,
                                                      child: Text(
                                                        "${selectedNovel.content.length}文字",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                NovelSararaRFont,
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      child: Text(
                                                        "作　${(selectedNovelUser.inAppUserName)}",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                NovelSararaRFont,
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                        textAlign: TextAlign.left,
                                                        maxLines: 2,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );

                              FeedNovelTile(
                                feedNovelMode: feedNovelMode,
                                novel: model.novels![index],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        }
        // } else {
        //   return Container(
        //     height: MediaQuery.of(context).size.height,
        //     color: Colors.black12,
        //     child: NovelDetailSubPage(
        //       persistentTabController: persistentTabController,
        //       feedNovelMode: feedNovelMode,
        //     ),
        //   );
        // }
      },
    );
  }

  Widget _selectedNovelListText(
    User? selectedWriter,
    FeedNovelMode selectedFeedNovelMode,
    BuildContext context,
  ) {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    switch (selectedFeedNovelMode) {
      case FeedNovelMode.ALL_NOVELS:
        return Text(
          "全部の小説:設定変更",
          style: TextStyle(fontSize: 20),
        );
      case FeedNovelMode.SELECTED_WRITERS_NOVELS:
        return Text(
          "${selectedWriter!.inAppUserName}の小説：設定変更",
          style: TextStyle(fontSize: 20),
        );
      case FeedNovelMode.MY_NOVELS:
        return Text(
          "${selectedWriter!.inAppUserName}の小説：設定変更",
          style: TextStyle(fontSize: 20),
        );
      case FeedNovelMode.SELECTED_NOVELS:
        return Text(
          "「${feedNovelViewModel.selectedTitle}」…　の小説：設定変更",
          style: TextStyle(fontSize: 20),
        );
      default:
        return Text("それ以外の小説");
    }
  }

  _readNovel(
    String novelId,
    int index,
    FeedNovelMode feedNovelMode,
    BuildContext context,
  ) {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    feedNovelViewModel.isFeedNovel = false;
    pushNewScreen(context,
        screen: ReadNovel(
          novelId: novelId,
          persistentTabController: persistentTabController,
          feedNovelMode: feedNovelMode,
          context: context,
        ),
        withNavBar: true);
  }

  void _settingNovelList(
    BuildContext context,
    FeedNovelMode feedNovelMode,
    PersistentTabController persistentTabController,
  ) {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    feedNovelViewModel.isFeedNovel = false;
    pushNewScreen(context,
        screen: SettingNovelList(
          context: context,
          feedNovelMode: feedNovelMode,
          persistentTabController: persistentTabController,
        ),
        withNavBar: true);
  }
}
