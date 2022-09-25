import 'package:flutter/material.dart';
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
    Future(() => feedNovelViewModel.getNovels(feedNovelMode));

    return Consumer<FeedNovelViewModel>(
      builder: (context, model, child) {
        if (model.isFeedNovel) {
          if (model.isProcessing) {
            print("くるくる");
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return (model.novels == null)
                ? Container()
                : RefreshIndicator(
                    onRefresh: () => model.getNovels(feedNovelMode),
                    child: ScrollablePositionedList.builder(
                      initialScrollIndex: model.selectedListIndex,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: model.novels!.length,
                      itemBuilder: (context, index) {
                        final List<Novel> novels = model.novels!;
                        final Novel selectedNovel = model.novels![index];
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            splashColor: Colors.black,
                            onTap: () => model.changeNovelDetailSubPage(
                                selectedNovel.novelId, index),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10, right: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                color: Colors.white70.withOpacity(0.8),
                                child: FutureBuilder(
                                  future: model
                                      .getNovelUserInfo(selectedNovel.userId),
                                  builder:
                                      (context, AsyncSnapshot<User> snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data != null) {
                                      final selectedNovelUser = snapshot.data!;
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
                                                    overflow: TextOverflow.fade,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child:
                                                      ConpactChangeJapaneaseDay(
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
        } else {
          return Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black12,
              child: NovelDetailSubPage(persistentTabController));
        }
      },
    );
  }
}

// ListTileではうまくいかない。
//   ListTile(
//   leading: Image.asset(
//     novelUser.inAppUserImage,
//     fit: BoxFit.contain,
//     width: 120,
//     height: 120,
//   ),
//
//   // dense: true,
//   title: Text(
//     "${model.novels?[index].title}",
//     style: TextStyle(
//         fontFamily: NovelSararaBFont,
//         fontSize: 20),
//   ),
//   subtitle: Column(
//     children: [
//       Row(
//         mainAxisAlignment:
//             MainAxisAlignment.spaceBetween,
//         children: [
//           ConpactChangeJapaneaseDay(
//             postDateTime: model
//                 .novels![index]
//                 .postDateTime,
//           ),
//           Text(
//             "${model.novels?[index].content.length}文字"
//             // 改行消したいが、これでは無理っぽい。
//             ,
//             style: TextStyle(
//                 fontFamily:
//                     NovelSararaRFont,
//                 color: Colors.black,
//                 fontSize: 18),
//           ),
//         ],
//       ),
//       Container(
//         width: double.infinity,
//         child: Text(
//           "作　${(novelUser.inAppUserName)}",
//           textAlign: TextAlign.left,
//           style: TextStyle(
//               fontFamily: NovelSararaRFont,
//               color: Colors.black,
//               fontSize: 18),
//         ),
//       ),
//     ],
//   ),
//   tileColor: Colors.white10,
// );
