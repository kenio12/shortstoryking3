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

  //TODO
 Future<void> novel() async{
   isProcessing = true;
   notifyListeners();
   await novelRepository.novel(
     UserRepository.currentUser,
   );
   isProcessing = false;
   notifyListeners();
 }

}