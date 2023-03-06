
// ignore_for_file: non_constant_identifier_names
import '../Components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');
  Future<void> setInitialUserData(String Class, String Name, String reg,
      String email, int points, int streak, String course, int length) async {
    return await brewCollection.doc(uid).set({
      'Name': Name,
      'Email': email,
      'Class': Class,
      'Registration No.': reg,
      'Points': points,
      'Coding Streak': streak,
      'ARRAY': List.filled(length, 0, growable: false),
      'DURATION': List.filled(130, 0, growable: false),
      'Main Course': course,
    });
  }
  Future<void> updateUserData(String Class, String Name,
      String email, int points, int streak, String coursename, int length) async {
    return await brewCollection.doc(uid).update({
      'Name': Name,
      'Email': email,
      'Class': Class,
      'Points': points,
      'Coding Streak': streak,
      'ARRAY': List.filled(length, 0, growable: false),
      'Main Course': coursename,
    });
  }
  Future<void> updateUserData2(String Class, String Name,
      String email, int points, int streak) async {
    return await brewCollection.doc(uid).update({
      'Name': Name,
      'Email': email,
      'Class': Class,
      'Points': points,
      'Coding Streak': streak,
    });
  }
  Future<void> updateUserPoints(int points) async {
    return await brewCollection.doc(uid).update({
      'Points': points,
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
  Future<void> updateUserCourse(String replace) async {
    return await brewCollection.doc(uid).update({
      'Main Course': replace,
    });
  }

  Stream<DocumentSnapshot> get brews {
    return brewCollection.doc(uid).snapshots();
  }
  Stream<QuerySnapshot> get Leaders
  {

    return brewCollection.orderBy('Points',descending: true).limit(3).snapshots();

  }

}
