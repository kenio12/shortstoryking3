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

  String selectedWriterToString = "";

  User? selectedWriter;

  String selectedTitle = "";

  String selectedGenre = "";

  String selectedWordCount = "";

  Future<void> getNovels(FeedNovelMode feedNovelMode, User? writer) async {
    isProcessing = true;
    notifyListeners();

    switch (feedNovelMode) {
      case FeedNovelMode.SEARCHED_BY_MULTIPLE_NOVELS:
        novels = await novelRepository.getNovelsSearchedByMultiple(
            selectedGenre, selectedWordCount);
        // print("${selectedWordCount}oo${selectedGenre}");
        selectedGenre = "";
        // selectedWordCount = "最大10,000文字数内";
        break;
      default:
        novels = await novelRepository.getNovels(
            feedNovelMode, writer, selectedTitle);
        selectedGenre = "";
        selectedWordCount = "最大10,000文字数内";
        break;
    }
    selectedFeedNovelMode = feedNovelMode;

    if (writer != null) {
      selectedWriter = writer;
    }

    isProcessing = false;
    notifyListeners();
  }

  Future<void> getNovelsByWriterName() async{
    isProcessing = true;
    notifyListeners();

    novels = await novelRepository.getNovelsByWriterName(
        selectedWriterToString);

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
  Future<void> deletedNovel(String novelId) async {}

}
