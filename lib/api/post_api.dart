import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:picflowapp/Notifer/Notifer_post.dart';
import 'package:picflowapp/posts/posts.dart';

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
