import 'package:flutter/material.dart';
import 'package:shortstoryking3/data_models/novel.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/models/repositories/novel_repository.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';
import 'package:shortstoryking3/utils/constants.dart';

class FeedNovelViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final NovelRepository novelRepository;

  FeedNovelViewModel({
    required this.userRepository,
    required this.novelRepository,
  });

  bool isProcessing = false;
  List<Novel>? novels = <Novel>[];

  late User feedNovelUser;
  User get currentUser => UserRepository.currentUser!;

  void setNovelFeedUser(FeedNovelMode feedNovelMode,User? user){
    if (feedNovelMode == FeedNovelMode.MY_NOVELS){
      feedNovelUser = currentUser;
    } else if (feedNovelMode == FeedNovelMode.SELECTED_WRITERS_NOVELS){
      feedNovelUser = user!;
    }
    }

  Future<void>  getNovels(FeedNovelMode feedNovelMode) async{
    print("1");
    isProcessing = true;
    notifyListeners();

    novels = await novelRepository.getNovels(feedNovelMode);

    isProcessing = false;
    notifyListeners();
  }

  // notifyListeners()なし版
  Future<void>  getNovels2(FeedNovelMode feedNovelMode) async{

    novels = await novelRepository.getNovels(feedNovelMode);

  }

}
