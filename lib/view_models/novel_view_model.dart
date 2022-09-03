import 'package:flutter/material.dart';
import 'package:shortstoryking3/models/repositories/novel_repository.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';

class NovelViewModel extends ChangeNotifier {
    final UserRepository userRepository;
    final NovelRepository novelRepository;

  NovelViewModel({
    required this.userRepository,
    required this.novelRepository,
});

  bool isProcessing = false;

    Future<void>  novelPosting(String novelTitle, String novelContent) async{
      isProcessing = true;
      notifyListeners();
      await novelRepository.novelPosting(
        UserRepository.currentUser!,
        novelTitle,
        novelContent
      );
      isProcessing = false;
      notifyListeners();
  }

}