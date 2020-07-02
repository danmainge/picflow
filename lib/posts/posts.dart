import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  String image;
  String caption; 
  String about;
  List category;
  Timestamp createdAt;
  
  Post();
  Post.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    image = data['image'];
    caption = data['caption'];
    category = data['category'];
    about = data['about'];
    createdAt = data['createAt'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'caption': caption,
      'about': about,
      'category': category,
      'createdAt': createdAt
    };
  }
}
