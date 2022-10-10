import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/data_models/novel.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/common/change_japanease_day.dart';
import 'package:shortstoryking3/view/home_screen.dart';
import 'package:shortstoryking3/view/writer/pages/writer_page.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';
import 'package:shortstoryking3/view_models/writer_view_model.dart';

class ReadNovel extends StatelessWidget {
  final String novelId;
  final PersistentTabController? persistentTabController;
  final FeedNovelMode feedNovelMode;
  final BuildContext context;

  ReadNovel({
    required this.novelId,
    this.persistentTabController,
    required this.feedNovelMode,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {

    // print("novel_detailの上　${feedNovelMode}");
    // Navigator.pop(context);
    // final feedNovelViewModel = context.read<FeedNovelViewModel>();
    // print("read画面上では${feedNovelViewModel.isFeedNovel}");

    final String selectedNovelId = novelId;
    // final int selectedListIndex = feedNovelViewPage.selectedListIndex;
    // final currentUser = feedNovelViewPage.currentUser;
    return Consumer<FeedNovelViewModel>(builder: (context, model, child) {
      if (model.isFeedNovel) {
        Future(() {Navigator.pop(context);} );
      }
      //スワイプでポップするべ
      return GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 18) {
            Navigator.pop(context);
          }
        },
        child: FutureBuilder(
          future: model.selectedNovelFromNovelId(selectedNovelId),
          builder: (context, AsyncSnapshot<Novel> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final selectedNovel = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 3.0, right: 3),
                      child: Container(
                        // color: Colors.black26,
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Container(
                              // alignment: Alignment.topCenter,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(),
                                  onPressed: () => Navigator.pop(context),
                                  // _changeFeedNovelSubPage(
                                  // selectedListIndex, context, feedNovelMode),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.handPointLeft,
                                        color: Colors.white,
                                      ),
                                      Text(" 一覧に戻る")
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8),
                                        child: FutureBuilder(
                                            future: model
                                                .getNovelUserInfo(
                                                    selectedNovel.userId),
                                            builder: (context,
                                                AsyncSnapshot<User> snapshot) {
                                              if (snapshot.hasData &&
                                                  snapshot.data != null) {
                                                final selectedNovelUser =
                                                    snapshot.data!;
                                                return Image.asset(
                                                  selectedNovelUser
                                                      .inAppUserImage,
                                                  fit: BoxFit.contain,
                                                  width: 120,
                                                  height: 120,
                                                );
                                              } else {
                                                return Container();
                                              }
                                            }))),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ChangeJapaneaseDay(
                                                  postDateTime:
                                                      selectedNovel.postDateTime),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        FutureBuilder(
                                            future: model
                                                .getNovelUserInfo(
                                                    selectedNovel.userId),
                                            builder: (context,
                                                AsyncSnapshot<User> snapshot) {
                                              if (snapshot.hasData &&
                                                  snapshot.data != null) {
                                                final novelUser = snapshot.data!;
                                                return Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 15.0),
                                                  child: Container(
                                                    alignment: Alignment.topRight,
                                                    child: InkWell(
                                                      onTap: () =>
                                                          _writerProfileChange(
                                                              context,
                                                              selectedNovel
                                                                  .userId),
                                                      splashColor: Colors.black26,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.white70,
                                                          // border: Border.all(width: 1),
                                                          // borderRadius: BorderRadius.circular(4.0)
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .handPointLeft,
                                                              color: Colors.black,
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                "  作：${novelUser.inAppUserName} ",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        NovelSararaBFont,
                                                                    fontSize:
                                                                        25.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Container();
                                              }
                                            }),
                                        SizedBox(height: 10.0),
                                        Container(
                                          alignment: Alignment.topRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "総文字数：${selectedNovel.content.length}文字　",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            // borderRadius: BorderRadius.circular(20),
                            border: Border(
                                top: BorderSide(width: 3),
                                bottom: BorderSide(width: 3))),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(" タイトル",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              // SizedBox(height: 3,),
                              Text(
                                "${selectedNovel.title}",
                                style: TextStyle(
                                    fontSize: 30, letterSpacing: 20, height: 1.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Container(
                    //     // width: double.infinity,
                    //     padding: const EdgeInsets.all(5.0),
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.black54, width: 2),
                    //         borderRadius: BorderRadius.circular(2.0),
                    //         color: Colors.white70.withOpacity(0.8)),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Column(
                    //         children: [
                    //           Container(
                    //             alignment: Alignment.topLeft,
                    //             child: Text(" タイトル",
                    //                 style: TextStyle(color: Colors.grey)),
                    //           ),
                    //           Container(
                    //             alignment: Alignment.bottomLeft,
                    //             child: Padding(
                    //               padding: const EdgeInsets.only(left: 8.0),
                    //               child: Text(
                    //                 "${selectedNovel.title}",
                    //                 style: TextStyle(
                    //                   color: Colors.black,
                    //                   // letterSpacing: 6.0,
                    //                   fontFamily: NovelSararaBFont,
                    //                   fontSize: 30,
                    //                   // backgroundColor: Colors.white,
                    //                   letterSpacing: 5,
                    //                   // shadows:[
                    //                   //    Shadow(
                    //                   //      blurRadius: 80.0,
                    //                   //    ),
                    //                   // ]
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0, right: 3),
                      child: Container(
                        // color: Colors.black26,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.white70.withOpacity(0.8),
                            ),
                            child: Column(
                              children: [
                                // Divider(
                                //   color: Colors.black26,
                                //   thickness: 1.0,
                                // ),
                                SizedBox(
                                  height: 10,
                                ),

                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "  以下本文",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(5.0),
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(color: Colors.black54, width: 1),
                                    //   // borderRadius: BorderRadius.circular(20.0),
                                    //   color: Colors.white24,
                                    // ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "${selectedNovel.content}",
                                        style: TextStyle(
                                          // letterSpacing: 6.0,
                                          fontFamily: NovelSararaRFont,
                                          fontSize: 28,
                                          // backgroundColor: Colors.white,
                                          letterSpacing: 2,
                                          color: Colors.black,
                                          // shadows:[
                                          //    Shadow(
                                          //      blurRadius: 80.0,
                                          //    ),
                                          // ]
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text("おわり ",
                                        style: TextStyle(color: Colors.grey)),
                                  ),
                                ),

                                // Divider(
                                //   color: Colors.black26,
                                //   thickness: 1.0,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 3.0, right: 3),
                      child: Container(
                        // color: Colors.black26,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              // alignment: Alignment.topCenter,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(),
                                  onPressed: () => Navigator.pop(context),
                                  // _changeFeedNovelSubPage(
                                  // selectedListIndex, context, feedNovelMode),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.handPointLeft,
                                        color: Colors.white,
                                      ),
                                      Text(" 一覧に戻る")
                                    ],
                                  )),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      );
    });
  }

  _writerProfileChange(BuildContext context, String userId) async {
    // pushNewScreen(
    //   context,
    //   screen: WriterPage(userId),
    //   withNavBar: true,
    //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
    // );

    //  やっぱこっちにした
    if (persistentTabController != null) {
      final writerViewModel = context.read<WriterViewModel>();
      await writerViewModel.getWriter(FeedWriterMode.SELECTED_WRITER, userId);
      persistentTabController?.jumpToTab(2);
    }
  }

// _changeFeedNovelSubPage(
//     int selectedListIndex,
//     BuildContext context,
//     FeedNovelMode feedNovelMode,
//     ) {
//   print("手前${feedNovelMode}");
//   final feedNovelViewModel = context.read<FeedNovelViewModel>();
//   feedNovelViewModel.changeFeedNovelSubPage(selectedListIndex, null,feedNovelMode);
// }
}
