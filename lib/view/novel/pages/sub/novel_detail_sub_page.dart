import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/data_models/novel.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';

class NovelDetailSubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedNovelViewPage = context.read<FeedNovelViewModel>();
    final String selectedNovelId = feedNovelViewPage.selectedNovelId;

    return FutureBuilder(
      future: feedNovelViewPage.selectedNovelFromNovelId(selectedNovelId),
      builder: (context, AsyncSnapshot<Novel> snapshot) {
    if (snapshot.hasData && snapshot.data != null) {
      final selectedNovel = snapshot.data!;
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text("やほおお、小説ページきたああ${selectedNovel.title}"),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () => feedNovelViewPage.changeFeedNovelSubPage(),
                child: Text("一覧に戻るよ"))
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
