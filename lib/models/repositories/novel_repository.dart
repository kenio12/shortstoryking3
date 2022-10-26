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
      String novelContent, String selectedGenre) async {
    final novel = Novel(
      isPublish: true,
      novelId: Uuid().v1(),
      userId: currentUser.userId,
      title: novelTitle,
      content: novelContent,
      postScript: "",
      genre: selectedGenre,
      battleType: "",
      eventType: "",
      battlePoint: 0,
      eventPoint: 0,
      wordCount: novelContent.length,
      saveDateTime: DateTime.now(),
      postDateTime: DateTime.now(),
    );
    await dbManager.insertNovel(novel);
  }

 Future<List<Novel>> getNovels(FeedNovelMode feedNovelMode, User? writer, String selectedTitle) async{
    switch (feedNovelMode){
      case FeedNovelMode.ALL_NOVELS:
      return await dbManager.getAllNovels();

      case FeedNovelMode.FAVORITE_WRITERS_NOVELS:
        return await dbManager.getAllNovels();

      case FeedNovelMode.FRIENDS_WRITERS_NOVELS:
        return await dbManager.getAllNovels();

      case FeedNovelMode.SELECTED_NOVELS:
        return await dbManager.getSelectedNovelListFromTitle(selectedTitle);

      case FeedNovelMode.SELECTED_WRITERS_NOVELS:
        return await dbManager.getSelectedWriterNovels(writer!);

      case FeedNovelMode.MY_NOVELS:
        return await dbManager.getSelectedWriterNovels(writer!);

    }

 }

 Future<Novel> selectedNovelFromNovelId(String selectedNovelId) async{
    return await dbManager.selectedNovelFromNovelId(selectedNovelId);
 }

 // Future<void> searchNovelListFromTitle(String selectedTitle) async {
 //    await dbManager.searchNovelListFromTitle(selectedTitle);
 // }
}