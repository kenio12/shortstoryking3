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
    print("novel:$results");
    return results;
  }

  Future<Novel> selectedNovelFromNovelId(String selectedNovelId) async{
    final query =
    await _db.collection("novels").where("novelId", isEqualTo: selectedNovelId).get();
    // print("$query.docs[0].");

    return Novel.fromMap(query.docs[0].data());
  }
}
