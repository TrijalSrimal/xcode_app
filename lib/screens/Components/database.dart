import 'package:cloud_firestore/cloud_firestore.dart';
import '../Components/constants.dart' as c;
class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future<void> setInitialUserData(String Class, String Name, String reg,
      String email, int points, int streak) async {
    return await brewCollection.doc(uid).set({
      'Name': Name,
      'Email': email,
      'Class': Class,
      'Registration No.': reg,
      'Points': points,
      'Coding Streak': streak,
      'ARRAY': List.filled(130, 0, growable: false),
      'DURATION': List.filled(130, 0, growable: false),
    });
  }
  Future<void> updateUserData(String Class, String Name, String reg,
      String email, int points, int streak) async {
    return await brewCollection.doc(uid).update({
      'Name': Name,
      'Email': email,
      'Class': Class,
      'Registration No.': reg,
      'Points': points,
      'Coding Streak': streak,
    });
  }
  Future<void> updateUserNameCLREG(String Class, String Name, String reg) async {
    return await brewCollection.doc(uid).update({
      'Name': Name,
      'Class': Class,
      'Registration No.': reg,
    });
  }
  Future<void> updateUserPoints(int points) async {
    return await brewCollection.doc(uid).update({
      'Points': points,
    });
  }
  Future<void> updateUserStreak(int streak) async {
    return await brewCollection.doc(uid).update({
      'Coding Streak': streak,
    });
  }
  Future<void> updateUserArray(List replace) async {
    return await brewCollection.doc(uid).update({
      'ARRAY': replace,
    });
  }
  Future<void> updateUserDuration(List replace) async {
    return await brewCollection.doc(uid).update({
      'DURATION': replace,
    });
  }

  Stream<DocumentSnapshot> get brews {
    return brewCollection.doc(uid).snapshots();
  }

}
