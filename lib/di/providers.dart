import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shortstoryking3/models/db/database_manager.dart';
import 'package:shortstoryking3/models/repositories/novel_repository.dart';
import 'package:shortstoryking3/models/repositories/user_repository.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';
import 'package:shortstoryking3/view_models/login_view_model.dart';
import 'package:shortstoryking3/view_models/novel_view_model.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels
];

List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(
    create: (_) => DatabaseManager(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<DatabaseManager, UserRepository>(
    update: (_, dbManager, repo) => UserRepository(dbManager: dbManager),
  ),
//  TODO
  ProxyProvider<DatabaseManager, NovelRepository>(
    update: (_, dbManager, repo) => NovelRepository(dbManager: dbManager),
  )
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(
            userRepository: context.read<UserRepository>(),
          )),
  ChangeNotifierProvider<NovelViewModel>(
    create: (context) => NovelViewModel(
      userRepository: context.read<UserRepository>(),
      novelRepository: context.read<NovelRepository>(),
    ),
  ),
  ChangeNotifierProvider<FeedNovelViewModel>(
    create: (context) => FeedNovelViewModel(
      userRepository: context.read<UserRepository>(),
      novelRepository: context.read<NovelRepository>(),
    ),
  ),
];
