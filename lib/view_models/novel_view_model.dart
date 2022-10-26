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

    Future<void>  novelPosting() async{
      isProcessing = true;
      notifyListeners();
      await novelRepository.novelPosting(
        UserRepository.currentUser!,
        writingNovelTitle,
        writingNovelContent,
        selectedGenre,
      );
      selectedGenre = "";
      writingNovelTitle = "";
      writingNovelContent= "";

      isProcessing = false;
      notifyListeners();
  }

}