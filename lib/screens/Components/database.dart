
// ignore_for_file: non_constant_identifier_names
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
      'POINT_ARRAY_DURATIONS': List.filled(314, 0, growable: false),
      'DURATION': List.filled(314, 0, growable: false),
      'Main Course': course,
      'Last_Video_Url': "",
      'Last_Duration': 0,
      'Last_Title': "",
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
  Future<void> updateUserStreak(int streak) async {
    return await brewCollection.doc(uid).update({
      'Coding Streak': streak,
    });
  }
  Future<void> updateUserLasts(String Last_Video_Url, int Last_Duration, String Last_title) async {
    return await brewCollection.doc(uid).update({
      'Last_Video_Url': Last_Video_Url,
      'Last_Duration': Last_Duration,
      'Last_Title': Last_title,
    });
  }

  Future<void> updateUserArray(List replace) async {
    return await brewCollection.doc(uid).update({
      'ARRAY': replace,
    });
  }
  Future<void> updateUserPointArray(List replace) async {
    return await brewCollection.doc(uid).update({
      'POINT_ARRAY_DURATIONS': replace,
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
