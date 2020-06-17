import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userinfoCollection =
      Firestore.instance.collection('userinfo');
  Future updateUserData(String username, String gender, String email
      //later add profile picture feild
      ) async {
    return await userinfoCollection
        .document(uid)
        .setData({'username': username, 'gender': gender, 'email': email});
  }

  // get userinfo stream
  Stream<QuerySnapshot> get userinfo {
    return userinfoCollection.snapshots();
  }
}
