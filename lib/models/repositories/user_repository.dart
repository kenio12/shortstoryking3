import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:shortstoryking3/models/db/database_manager.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../data_models/user.dart';

class UserRepository {
  final DatabaseManager dbManager;

  UserRepository({required this.dbManager});

  static User? currentUser;

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  Future<bool> isSighIn() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      //再度、アクセスした際に、currentUserを取ってくるためのもの。
      currentUser = await dbManager.getUserInfoFromDbById(firebaseUser.uid);
      return true;
    }
    return false;
  }

  Future<bool> sighIn() async {
    try {
      // Create a TwitterLogin instance
      final twitterLogin = new TwitterLogin(
        apiKey: "9eHrjSsXIODkX9KRVxY2Jzk8M",
        apiSecretKey: "hCU0uub9dDLPb7V3gZelsmeehZwRQjE34B7YlM2NPpGSgEqgES",
        redirectURI: "shortstoryking3://",
      );

      /// Forces the user to enter their credentials
      /// to ensure the correct users account is authorized.
      /// If you want to implement Twitter account switching, set [force_login] to true
      /// login(forceLogin: true);
      print("kokokokoここあ");
      final authResult = await twitterLogin.loginV2();
      print("waaaa");
      switch (authResult.status) {
        case TwitterLoginStatus.loggedIn:
        // success
        //   print("${authResult.status}");
          print('====== Login success ======');

          // まるこぴ　Create a credential from the access token
          final twitterAuthCredential = auth.TwitterAuthProvider.credential(
            accessToken: authResult.authToken!,
            secret: authResult.authTokenSecret!,
          );
          // まるこぴ　Once signed in, return the UserCredential
          auth.UserCredential userCredential =
          await _auth.signInWithCredential(twitterAuthCredential);
          final firebaseUser = userCredential.user;
          if (firebaseUser == null) {
            print('====== ツイッターに登録されてないようだ ======');
            return false;
          }
          print('====== 入れたぜえ！ ======');

          final isUserExistedDb = await dbManager.searchUserInDb(firebaseUser);

          if (!isUserExistedDb) {
            await dbManager.insertUser(_convertToUser(firebaseUser));
          }
          // print("ここは？");

          //DBから取ってきたUserDataを、上で宣言したstatic変数に入れる。
          currentUser = await dbManager.getUserInfoFromDbById(firebaseUser.uid);
          // print("${currentUser?.inAppUserImage}");
          return true;
          break;
        case TwitterLoginStatus.cancelledByUser:
        // cancel
          print('====== Login cancel ======');
          return false;
          break;
        case TwitterLoginStatus.error:
        case null:
        // error
          print('====== Login error ======');
          return false;
          break;
      }
    } catch (error) {
      print("sigh in error caught!:${error.toString()}");
      return false;
    }
  }

  _convertToUser(auth.User firebaseUser) {
    return User(
      userId: firebaseUser.uid,
      twitterName: firebaseUser.displayName ?? "",
      inAppUserName: firebaseUser.displayName ?? "",
      inAppUserImage: "assets/images/level1_avatar/baby.png",
      bio: "",
      address: "",
      sex: "",
      writerGenre: [],
      writerWordCount: [],
      score: 0,
      level: 0,
      age: 0,
      era: "",
    );
  }

  Future<User> getUserById(String? userId) async {
    return await dbManager.getUserInfoFromDbById(userId!);
  }

  Future<void> signOut() async {
    await _auth.signOut();
    currentUser = null;
  }

  // Future<void> changeProfileImage(String inAppUserImage) async {
  //   String newInAppUserImage = "";
  //   switch (inAppUserImage) {
  //     case "assets/images/level1_avatar/baby.png":
  //       newInAppUserImage = "assets/images/level1_avatar/baby2.png";
  //       break;
  //     case "assets/images/level1_avatar/baby2.png":
  //       newInAppUserImage = "assets/images/level1_avatar/baby3.png";
  //       break;
  //     case "assets/images/level1_avatar/baby3.png":
  //       newInAppUserImage = "assets/images/level1_avatar/baby4.png";
  //       break;
  //     case "assets/images/level1_avatar/baby4.png":
  //       newInAppUserImage = "assets/images/level1_avatar/baby5.png";
  //       break;
  //     case "assets/images/level1_avatar/baby5.png":
  //       newInAppUserImage = "assets/images/level1_avatar/baby.png";
  //       break;
  //   }
  //   final currentUserBeforeUpdate =
  //       await dbManager.getUserInfoFromDbById(currentUser!.userId);
  //   final updateCurrentUser =
  //       currentUserBeforeUpdate.copyWith(inAppUserImage: newInAppUserImage);
  //
  //   await dbManager.changeProfileImage(updateCurrentUser);
  //   currentUser = await dbManager.getUserInfoFromDbById(currentUser!.userId);
  // }

  Future<void> changeProfile(String inAppUserImage,
      String sex,
      String era,
      String address,
      String bio,
      String inAppUserName,) async {
    final currentUserBeforeUpdate =
    await dbManager.getUserInfoFromDbById(currentUser!.userId);
    final updateCurrentUser = currentUserBeforeUpdate.copyWith(
      inAppUserImage: inAppUserImage,
      sex: sex,
      era: era,
      address: address,
      bio: bio,
      inAppUserName: inAppUserName,
    );

    await dbManager.changeProfile(updateCurrentUser);
    currentUser = await dbManager.getUserInfoFromDbById(currentUser!.userId);
  }

  Future<List<User>> getWriter(FeedWriterMode feedWriterMode,
      String? novelSelectedUserUserId,) async {
    switch (feedWriterMode) {
      case FeedWriterMode.All_Writer:
        return await dbManager.getAllWriter();
      case FeedWriterMode.SELECTED_WRITER:
        return await dbManager.getSelectedWriter(novelSelectedUserUserId!);
    }
  }

  Future<List<User>> writerSearchedByMultipleConditions(String selectedWriterName) async{
    return await dbManager.writerSearchedByMultipleConditions(selectedWriterName);
  }


  Future<void> UserGenreAndWordCountInput(String selectedGenre,
      String writerWordCount,
      User user,) async {
    final currentUserBeforeUpdate =
    await dbManager.getUserInfoFromDbById(user.userId);

    List<String> addWriterGenre = [];
    addWriterGenre = currentUserBeforeUpdate.writerGenre;
    addWriterGenre.add(selectedGenre);
    addWriterGenre = addWriterGenre.toSet().toList();
    // print(addWriterGenre.runtimeType);
    // print(currentUserBeforeUpdate.writerGenre.runtimeType);


    // print("${selectedGenre}");
    // print("${addWriterGenre}");

    List<String> addWriterWordCount = [];
    addWriterWordCount= currentUserBeforeUpdate.writerWordCount;
    addWriterWordCount.add(writerWordCount);
    addWriterWordCount = addWriterWordCount.toSet().toList();

    final updateCurrentUser = currentUserBeforeUpdate.copyWith(
      writerGenre: addWriterGenre,
      writerWordCount: addWriterWordCount,
    );
    await dbManager.changeProfile(updateCurrentUser);
    currentUser = await dbManager.getUserInfoFromDbById(user.userId);
  }

}