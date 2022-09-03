import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/novel/components/feed_novel_tile.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';

class FeedNovelSubPage extends StatelessWidget {
  final FeedNovelMode feedNovelMode;

  FeedNovelSubPage({required this.feedNovelMode});

  @override
  Widget build(BuildContext context) {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    Future(() =>feedNovelViewModel.getNovels(feedNovelMode));

    return Consumer<FeedNovelViewModel>(
      builder: (context,model,child){
        if (model.isProcessing){
          print("くるくる");
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return (model.novels == null) ? Container()
              : ListView.builder(
              itemCount: model.novels!.length,
              itemBuilder: (context,index){
                return FeedNovelTile(
                  feedNovelMode: feedNovelMode,
                  novel: model.novels![index],
                );
              }
          );
        }
      },
    );
  }
}
