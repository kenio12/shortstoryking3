import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:shortstoryking3/data_models/novel.dart';

import '../../data_models/user.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> searchUserInDb(auth.User firebaseUser) async {
    final query = await _db
        .collection("users")
        .where("userId", isEqualTo: firebaseUser.uid)
        .get();
    if (query.docs.length > 0) {
      return true;
    }
    return false;
  }

  Future<void> insertUser(User user) async {
    await _db.collection("users").doc(user.userId).set(user.toMap());
  }

  // Future<void> changeProfileImage(User updateCurrentUser) async{
  //   final reference = _db.collection("users").doc(updateCurrentUser.userId);
  //   await reference.update(updateCurrentUser.toMap());
  // }

  Future<void> changeProfile(User updateCurrentUser) async {
    final reference = _db.collection("users").doc(updateCurrentUser.userId);
    await reference.update(updateCurrentUser.toMap());
  }

  Future<User> getUserInfoFromDbById(String userId) async {
    final query =
    await _db.collection("users").where("userId", isEqualTo: userId).get();
    // print("$query.docs[0].");

    return User.fromMap(query.docs[0].data());
  }

  Future<void> insertNovel(Novel novel) async {
    _db.collection("novels").doc(novel.novelId).set(novel.toMap());
  }

  // 全部の小説を抽出
  Future<List<Novel>> getAllNovels() async {
    final query = await _db.collection("novels").get();
    if (query.docs.length == 0) return [];

    var results = <Novel>[];
    await _db
        .collection("novels")
        .orderBy("postDateTime", descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(Novel.fromMap(
          element.data(),
        ));
      });
    });
    // print("novel:$results");
    return results;
  }

  Future<Novel> selectedNovelFromNovelId(String selectedNovelId) async {
    final query = await _db
        .collection("novels")
        .where("novelId", isEqualTo: selectedNovelId)
        .get();
    // print("$query.docs[0].");

    return Novel.fromMap(query.docs[0].data());
  }

  Future<List<User>> getAllWriter() async {
    final query = await _db.collection("users").get();
    if (query.docs.length == 0) return [];

    var results = <User>[];
    await _db
        .collection("users")
        .orderBy("inAppUserName", descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(User.fromMap(
          element.data(),
        ));
      });
    });
    print("おおおおい　users:$results");
    return results;
  }

  Future<List<User>> getSelectedWriter(String novelSelectedUserUserId) async {
    final query = await _db
        .collection("users")
        .where("userId", isEqualTo: novelSelectedUserUserId)
        .get();
    if (query.docs.length == 0) return [];

    var results = <User>[];
    await _db
        .collection("users")
        .where("userId", isEqualTo: novelSelectedUserUserId)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(User.fromMap(
          element.data(),
        ));
      });
    });
    print("おおおおい　users:$results");
    return results;
  }

  Future<List<Novel>> getSelectedWriterNovels(User writer) async {
    final query = await _db
        .collection("novels")
        .where("userId", isEqualTo: writer.userId)
        .get();
    if (query.docs.length == 0) return [];

    var results = <Novel>[];
    await _db
        .collection("novels")
        .where("userId", isEqualTo: writer.userId)
        .orderBy("postDateTime", descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(Novel.fromMap(
          element.data(),
        ));
      });
    });
    // print("novel:$results");
    return results;
  }

  Future<List<Novel>> getSelectedNovelListFromTitle(
      String selectedTitle) async {
    final query = await _db
        .collection("novels")
        .orderBy("title")
        .startAt([selectedTitle]).endAt([selectedTitle + '\uf8ff']).get();
    if (query.docs.length == 0) return <Novel>[];

    var results = <Novel>[];
    await _db
        .collection("novels")
        .orderBy("title")
        .startAt([selectedTitle])
        .endAt([selectedTitle + '\uf8ff'])
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(Novel.fromMap(
          element.data(),
        ));
      });
    });
    print("novel:$results");
    return results;
  }

  Future<List<Novel>> getNovelsSearchedByMultiple(String selectedGenre,
      String selectedWordCount) async {
    // print("${selectedWordCount}oo${selectedGenre}");
    int selectedWordCountInt = 0;
    switch (selectedWordCount) {
      case "最大10,000文字数内":
        selectedWordCountInt = 10000;
        break;
      case "5,000文字数内":
        selectedWordCountInt = 5000;
        break;
      case "3,000文字数内":
        selectedWordCountInt = 3000;
        break;
      case "2,000文字数内":
        selectedWordCountInt = 2000;
        break;
      case "1,000文字数内":
        selectedWordCountInt = 1000;
        break;
      case "500文字数内":
        selectedWordCountInt = 500;
        break;
      case "200文字数内":
        selectedWordCountInt = 200;
        break;
      case "100文字数内":
        selectedWordCountInt = 100;
        break;
      case "50文字数内":
        selectedWordCountInt = 50;
        break;
    }

    if (selectedGenre == "") {
      final query = await _db
          .collection("novels")
          .orderBy("wordCount")
          .where("wordCount", isLessThanOrEqualTo: selectedWordCountInt)
          .orderBy("postDateTime", descending: true)
          .get();
      if (query.docs.length == 0) return [];
      var results = <Novel>[];
      await _db
          .collection("novels")
          .orderBy("wordCount")
          .where("wordCount", isLessThanOrEqualTo: selectedWordCountInt)
          .orderBy("postDateTime", descending: true)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          results.add(Novel.fromMap(
            element.data(),
          ));
        });
      });
      // print("novel:$results");
      results.sort((a, b) => -a.postDateTime.compareTo(b.postDateTime));
      return results;
    } else {
      final query = await _db
          .collection("novels")
          .orderBy("wordCount")
          .where("wordCount", isLessThanOrEqualTo: selectedWordCountInt)
          .where("genre", isEqualTo: selectedGenre)
          .orderBy("postDateTime", descending: true)
          .get();
      if (query.docs.length == 0) return [];

      var results = <Novel>[];
      await _db
          .collection("novels")
          .orderBy("wordCount")
          .where("wordCount", isLessThanOrEqualTo: selectedWordCountInt)
          .where("genre", isEqualTo: selectedGenre)
          .orderBy("postDateTime", descending: true)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          results.add(Novel.fromMap(
            element.data(),
          ));
        });
      });
      // print("novel:$results");
      results.sort((a, b) => -a.postDateTime.compareTo(b.postDateTime));
      return results;
    }
  }

  writerSearchedByMultipleConditions(String selectedWriterName) async {
      final query = await _db
          .collection("users")
          .orderBy("inAppUserName")
          .startAt([selectedWriterName]).endAt([selectedWriterName + '\uf8ff']).get();
      if (query.docs.length == 0) return <Novel>[];

      var results = <User>[];
      await _db
          .collection("users")
          .orderBy("inAppUserName")
          .startAt([selectedWriterName])
          .endAt([selectedWriterName + '\uf8ff'])
          .get()
          .then((value) {
        value.docs.forEach((element) {
          results.add(User.fromMap(
            element.data(),
          ));
        });
      });
      print("users:$results");
      return results;
    }

}
