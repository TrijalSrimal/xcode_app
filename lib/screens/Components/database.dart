import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(String Class, String Name, String reg,
      String email, int points, int streak) async {
    return await brewCollection.doc(uid).set({
      'Name': Name,
      'Email': email,
      'Class': Class,
      'Registration No.': reg,
      'Points': points,
      'Coding Streak': streak,
    });
  }

  Stream<DocumentSnapshot> get brews {
    return brewCollection.doc(uid).snapshots();
  }
}
