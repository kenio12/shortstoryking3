import 'package:flutter/material.dart';
import 'package:shortstoryking3/data_models/novel.dart';
import 'package:shortstoryking3/utils/constants.dart';

class FeedNovelTile extends StatelessWidget {
  final FeedNovelMode feedNovelMode;
  final Novel novel;

  FeedNovelTile({required this.feedNovelMode,required this.novel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(novel.title),
    );
  }
}
