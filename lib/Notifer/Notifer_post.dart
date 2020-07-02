import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:picflowapp/posts/posts.dart';

class PostNotifier with ChangeNotifier {
  List<Post> _postList = [];
  Post _currentPost;
  UnmodifiableListView<Post> get postList => UnmodifiableListView(_postList);
  Post get currentPost => _currentPost;
  set postList(List<Post> postList) {
    _postList = _postList;
    notifyListeners();
  }

  set currentPost(Post post) {
    _currentPost = post;
    notifyListeners();
  }
}
