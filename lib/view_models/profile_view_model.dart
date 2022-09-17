import 'package:flutter/material.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/models/repositories/novel_repository.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';

class ProfileViewModel extends ChangeNotifier{
  final UserRepository userRepository;
  final NovelRepository novelRepository;

  ProfileViewModel({
    required this.userRepository,
    required this.novelRepository,
  });

  late User profileUser;
  User get currentUser => UserRepository.currentUser!;

 Future<void> signOut() async{
   await userRepository.signOut();
       notifyListeners();
 }

 Future<void> changeProfileImage(String inAppUserImage) async{
  await userRepository.changeProfileImage(inAppUserImage);
  notifyListeners();
 }
}
