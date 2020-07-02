import 'package:firebase_auth/firebase_auth.dart';
import 'package:picflowapp/models/user.dart';
import 'package:picflowapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:picflowapp/Notifer/Notifer_post.dart';
import 'package:picflowapp/posts/posts.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // CREATE USER OBJ based on firebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//  auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
//        .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

//  sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with uid
      await DatabaseService(uid: user.uid)
          .updateUserData('new member', 'apachee', '0');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  getPosts(PostNotifier postNotifier) async {
    QuerySnapshot snapshot =
        await Firestore.instance.collection('post').getDocuments();
    List<Post> _postList = [];
    snapshot.documents.forEach((document) {
      Post post = Post.fromMap(document.data);
      _postList.add(post);
    });
    postNotifier.postList = _postList;
  }
}
