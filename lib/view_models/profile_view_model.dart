import 'package:flutter/material.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/models/repositories/novel_repository.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view_models/writer_view_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final NovelRepository novelRepository;

  ProfileViewModel({
    required this.userRepository,
    required this.novelRepository,
  });

  late User profileUser;

  late MyHomeMode myHomeMode = MyHomeMode.NORMAL_PROFILE;

  User get currentUser => UserRepository.currentUser!;

  // bool isFinishEditProfile = false;

  Future<void> signOut() async {
    await userRepository.signOut();
    myHomeMode = MyHomeMode.NORMAL_PROFILE;
    notifyListeners();
  }

  // Future<void> changeProfileImage(String inAppUserImage) async {
  //   await userRepository.changeProfileImage(inAppUserImage);
  //   notifyListeners();
  // }

  Future<void> changeProfile(
    String inAppUserImage,
    String sex,
    String era,
    String address,
    String bio,
    String inAppUserName,
  ) async {
    await userRepository.changeProfile(
      inAppUserImage,
      sex,
      era,
      address,
      bio,
      inAppUserName,
    );
    // isFinishEditProfile = false;
    final writerViewModel = WriterViewModel(
        userRepository: userRepository, novelRepository: novelRepository);
    await writerViewModel.getWriter(FeedWriterMode.SELECTED_WRITER,currentUser.userId);
    ChangeNotifier();
  }

  void changeEditMyProfile() {
    myHomeMode = MyHomeMode.EDIT_PROFILE;
    notifyListeners();
  }

  Future<void> changeNormalMyProfile() async{
    myHomeMode = MyHomeMode.NORMAL_PROFILE;
    await userRepository.getWriter(FeedWriterMode.SELECTED_WRITER,currentUser.userId);
    notifyListeners();
  }

  // void finishEditProfile() {
  //   isFinishEditProfile = true;
  //   ChangeNotifier();
  // }
}
