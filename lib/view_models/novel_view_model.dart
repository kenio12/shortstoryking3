import 'package:flutter/material.dart';
import 'package:shortstoryking3/models/repositories/novel_repository.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';

class NovelViewModel extends ChangeNotifier {
    final UserRepository userRepository;
    final NovelRepository novelRepository;

  NovelViewModel({
    required this.userRepository,
    required this.novelRepository,
});

  bool isProcessing = false;

  String selectedGenre = "";
  String writingNovelTitle = "";
  String writingNovelContent = "";

  // String writerGenre = "";
  //  TODO 次いらんかも。。
  String writerWordCount = "";

    Future<void>  novelPosting() async{
      isProcessing = true;
      notifyListeners();

      if (writingNovelContent.length < 100){
        writerWordCount = "100文字数内";
      } else if (writingNovelContent.length < 200){
        writerWordCount = "200文字数内";
      } else if (writingNovelContent.length < 500){
        writerWordCount = "500文字数内";
      } else if (writingNovelContent.length < 1000){
        writerWordCount = "1,000文字数内";
      } else if (writingNovelContent.length < 2000){
        writerWordCount = "2,000文字数内";
      } else if (writingNovelContent.length < 3000){
        writerWordCount = "3,000文字数内";
      } else if (writingNovelContent.length < 5000){
        writerWordCount = "5,000文字数内";
      } else if (writingNovelContent.length < 10000){
        writerWordCount = "最大10,000文字数内";
      }

      await novelRepository.novelPosting(
        UserRepository.currentUser!,
        writingNovelTitle,
        writingNovelContent,
        selectedGenre,
      );

      await userRepository.UserGenreAndWordCountInput(
          selectedGenre,writerWordCount,UserRepository.currentUser!,
      );

      selectedGenre = "";
      writingNovelTitle = "";
      writingNovelContent= "";

      isProcessing = false;
      notifyListeners();
  }

}