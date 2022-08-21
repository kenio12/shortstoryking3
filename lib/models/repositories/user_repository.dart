import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:shortstoryking3/models/db/database_manager.dart';

class UserRepository{
  final DatabaseManager dbManager;
  UserRepository({required this.dbManager});

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

 Future<bool> isSighIn() async{
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null){
      return true;
    }
     return false;
 }
}