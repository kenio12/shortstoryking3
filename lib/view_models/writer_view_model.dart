import 'package:flutter/material.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/models/repositories/novel_repository.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';

class WriterViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final NovelRepository novelRepository;

  WriterViewModel({
    required this.userRepository,
    required this.novelRepository,
  });


  late User profileUser;

  User get currentUser => UserRepository.currentUser!;

}