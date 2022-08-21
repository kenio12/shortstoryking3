import 'package:flutter/material.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  LoginViewModel({required this.userRepository});

  Future<bool> isSighIn() async{
    return await userRepository.isSighIn();
  }

}