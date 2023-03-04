import 'package:flutter/material.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/models/repositories/novel_repository.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';
import 'package:shortstoryking3/utils/constants.dart';

class WriterViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final NovelRepository novelRepository;

  WriterViewModel({
    required this.userRepository,
    required this.novelRepository,
  });

  bool isProcessing = false;

  bool isFeedNovel = false;

  List<User>? writers = <User>[];

  late User profileUser;

  User get currentUser => UserRepository.currentUser!;

  String selectedWriterName = "";

  String selectedGenre = "";

  Future<void>  getWriter(FeedWriterMode feedWriterMode,String? novelSelectedUserUserId) async{
    isProcessing = true;
    notifyListeners();

    writers = await userRepository.getWriter(feedWriterMode,novelSelectedUserUserId);

    isProcessing = false;
    notifyListeners();
  }

  Future<void> writerSearchedByMultipleConditions() async{
    // print("ここで${selectedGenre}");
    isProcessing = true;
    notifyListeners();

    writers = await userRepository.writerSearchedByMultipleConditions(
        selectedWriterName,selectedGenre);

    isProcessing = false;
    notifyListeners();

  }


}