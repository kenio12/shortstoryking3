import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/data_models/novel.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/view/common/change_japanease_day.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';

class NovelDetailSubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedNovelViewPage = context.read<FeedNovelViewModel>();
    final String selectedNovelId = feedNovelViewPage.selectedNovelId;
    final currentUser = feedNovelViewPage.currentUser;
    return FutureBuilder(
        future: feedNovelViewPage.selectedNovelFromNovelId(selectedNovelId),
        builder: (context, AsyncSnapshot<Novel> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final selectedNovel = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: ElevatedButton(
                      onPressed: () => feedNovelViewPage.changeFeedNovelSubPage(),
                      child: Text("一覧に戻るよ",style: TextStyle(fontSize: 20),),),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      // width: double.infinity,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 5),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black87
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("${selectedNovel.title}",
                            style: TextStyle(
                              color: Colors.white70,
                              // letterSpacing: 6.0,
                              fontFamily: NovelSararaBFont,
                              fontSize: 30,
                              // backgroundColor: Colors.white,
                              letterSpacing: 10,
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
                  ),
                  Container(
                    alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(top:25,right: 20.0),
                      child: ChangeJapaneaseDay(postDateTime: selectedNovel.postDateTime)),
                  FutureBuilder(
                      future: feedNovelViewPage.getNovelUserInfo(
                          selectedNovel.userId),
                      builder: (context, AsyncSnapshot<User> snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          final novelUser = snapshot.data!;
                          return Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text(
                                    "作　${novelUser.inAppUserName}"
                                    ,style: TextStyle(
                                        fontFamily: NovelSararaBFont,
                                  fontSize: 25.0
                                ),
                                ),
                              )
                          );
                        } else {
                          return Container();
                        }
                      }
                  ),

                  SizedBox(height: 20.0),

                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      // width: double.infinity,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 2),
                        // borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white24,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("${selectedNovel.content}",
                            style: TextStyle(
                              // letterSpacing: 6.0,
                              fontFamily: NovelSararaRFont,
                              fontSize: 28,
                              // backgroundColor: Colors.white,
                              letterSpacing: 1,
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
                  ),

                ],
              ),
            );
          } else {
            return Container();
          }
        }
    );
  }
}
