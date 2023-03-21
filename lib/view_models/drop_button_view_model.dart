import 'package:flutter/material.dart';
import '../models/repositories/novel_repository.dart';
import '../models/repositories/user_repository.dart';

class DropButtonViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final NovelRepository novelRepository;

  DropButtonViewModel({
    required this.userRepository,
    required this.novelRepository,
  });

  String selectedGenre = "";


}