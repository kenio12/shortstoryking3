import 'package:flutter/material.dart';
import 'package:shortstoryking3/data_models/novel.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/models/db/database_manager.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:uuid/uuid.dart';

class NovelRepository {

  final DatabaseManager dbManager;
  NovelRepository({required this.dbManager});

  Future<void> novelPosting(User currentUser, String novelTitle,
      String novelContent) async {
    final novel = Novel(
      isPublish: true,
      novelId: Uuid().v1(),
      userId: currentUser.userId,
      title: novelTitle,
      content: novelContent,
      postScript: "",
      genre: "",
      wordCount: "",
      battleType: "",
      saveDateTime: DateTime.now(),
      postDateTime: DateTime.now(),
    );
    await dbManager.insertNovel(novel);
  }

 Future<List<Novel>> getNovels(FeedNovelMode feedNovelMode) async{
    switch (feedNovelMode){
      case FeedNovelMode.ALL_NOVELS:
      return dbManager.getAllNovels();

      case FeedNovelMode.FAVORITE_WRITERS_NOVELS:
        return dbManager.getAllNovels();

      case FeedNovelMode.FRIENDS_WRITERS_NOVELS:
        return dbManager.getAllNovels();

      case FeedNovelMode.SELECTED_NOVELS:
        return dbManager.getAllNovels();

      case FeedNovelMode.SELECTED_WRITERS_NOVELS:
        return dbManager.getAllNovels();

      case FeedNovelMode.MY_NOVELS:
        return dbManager.getAllNovels();

    }

 }
}