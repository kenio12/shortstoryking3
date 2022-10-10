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

  bool isFeedNovel = false;

  String selectedNovelId = "";

  int selectedListIndex = 0;

  FeedNovelMode selectedFeedNovelMode = FeedNovelMode.ALL_NOVELS;

  User? selectedWriter;

  String selectedTitle = "";

  // void setNovelFeedUser(FeedNovelMode feedNovelMode,User? user){
  //   if (feedNovelMode == FeedNovelMode.MY_NOVELS){
  //     feedNovelUser = currentUser;
  //   } else if (feedNovelMode == FeedNovelMode.SELECTED_WRITERS_NOVELS){
  //     feedNovelUser = user!;
  //   }
  //   }

  Future<void> getNovels(FeedNovelMode feedNovelMode, User? writer) async {
    // print("1");
    isProcessing = true;
    notifyListeners();

    novels =
        await novelRepository.getNovels(feedNovelMode, writer, selectedTitle);

    selectedFeedNovelMode = feedNovelMode;

    if (writer != null) {
      selectedWriter = writer;
    }

    isProcessing = false;
    notifyListeners();
  }

  Future<User> getNovelUserInfo(String? userId) async {
    return await userRepository.getUserById(userId);
  }

  void changeNovelDetailSubPage(
    String novelId,
    int index,
    FeedNovelMode feedNovelMode,
  ) {
    selectedFeedNovelMode = feedNovelMode;
    isFeedNovel = false;
    selectedNovelId = novelId;
    selectedListIndex = index;
    notifyListeners();
  }

  void changeFeedNovelSubPage(
    int selectedListIndex2,
    User? writer,
    FeedNovelMode feedNovelMode,
  ) async {
    print("${feedNovelMode}");
    switch (feedNovelMode) {
      case FeedNovelMode.SELECTED_WRITERS_NOVELS:
        await getNovels(FeedNovelMode.SELECTED_WRITERS_NOVELS, writer);
        break;
      case FeedNovelMode.MY_NOVELS:
        await getNovels(FeedNovelMode.MY_NOVELS, currentUser);
        break;

      case FeedNovelMode.ALL_NOVELS:
        await getNovels(FeedNovelMode.ALL_NOVELS, null);
        break;
      case FeedNovelMode.SELECTED_NOVELS:
        await getNovels(FeedNovelMode.SELECTED_NOVELS, null);
        break;
      default:
        await getNovels(FeedNovelMode.ALL_NOVELS, null);
        break;
    }
    selectedListIndex = selectedListIndex2;
    isFeedNovel = true;
    notifyListeners();
  }

  Future<Novel> selectedNovelFromNovelId(String selectedNovelId) async {
    return await novelRepository.selectedNovelFromNovelId(selectedNovelId);
  }

  //TODO 小説消す
  deletedNovel(String novelId) {}



}
