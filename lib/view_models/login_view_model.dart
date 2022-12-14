import 'package:flutter/material.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  LoginViewModel({required this.userRepository});

  bool isLoading = false;
  bool isSuccessful = false;

  Future<bool> isSighIn() async{
    return await userRepository.isSighIn();
  }

 Future<void> signIn() async{
    isLoading = true;
    notifyListeners();

    isSuccessful = await userRepository.sighIn();
    isLoading = false;
    notifyListeners();
 }

}