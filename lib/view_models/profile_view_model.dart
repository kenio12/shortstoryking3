import 'package:flutter/material.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/models/repositories/novel_repository.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';
import 'package:shortstoryking3/utils/constants.dart';

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
    ChangeNotifier();
  }

  void changeEditMyProfile() {
    myHomeMode = MyHomeMode.EDIT_PROFILE;
    notifyListeners();
  }

  void changeNormalMyProfile() {
    myHomeMode = MyHomeMode.NORMAL_PROFILE;
    notifyListeners();
  }
}
