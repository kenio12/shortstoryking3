import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view_models/writer_view_model.dart';

class FeedWriterPage extends StatelessWidget {
  final FeedWriterMode feedWriterMode;

  FeedWriterPage({required this.feedWriterMode});

  @override
  Widget build(BuildContext context) {
    final writerViewModel = context.read<WriterViewModel>();
    Future(() => writerViewModel.getWriter(feedWriterMode));

    return Consumer<FeedNovelViewModel>(
      builder: (context, model, child) {
        if (model.isFeedNovel) {
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
                      onLongPress: () => model.changeNovelDetailSubPage(
                          selectedNovel.novelId, index),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0,top: 10,right: 10),
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
                                        padding:
                                        const EdgeInsets.only(left: 10.0,top:10.0),
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
              child: NovelDetailSubPage());
        }
      },
    );
  }
}
