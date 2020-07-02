import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:picflowapp/Notifer/Notifer_post.dart';
import 'package:picflowapp/api/post_api.dart';
import 'package:picflowapp/posts/posts.dart';
import 'package:picflowapp/posts/upload.dart';
import 'package:picflowapp/screens/settings/settings.dart';
import 'package:picflowapp/services/auth.dart';
import 'package:picflowapp/Notifer/Notifer_post.dart';
import 'package:provider/provider.dart';
import 'package:picflowapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picflowapp/screens/comment.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    PostNotifier postNotifier =
        Provider.of<PostNotifier>(context, listen: false);
    getPosts(postNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PostNotifier postNotifier =
        Provider.of<PostNotifier>(context, listen: false);
    print('HOME');
    return Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
         
          title: Text('picflow'),
          backgroundColor: Colors.grey[800],
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                }),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              trailing: Card(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Foundation.like), onPressed: () {},
                      //upvote functionallity
                    ),
                    IconButton(
                      icon: Icon(Foundation.comment),
                      onPressed: () {
                        postNotifier.currentPost = postNotifier.postList[index];
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Comments();
                        }));
                      },
                    ),
                  ],
                ),
              ),
              leading: Text(postNotifier.postList[index].caption),
              title: Image.network(
                postNotifier.postList[index].image,
                width: 300,
                height: 400,
                fit: BoxFit.fitWidth,
              ),
              subtitle: Text(postNotifier.postList[index].about),
              onTap: () {
                postNotifier.currentPost = postNotifier.postList[index];
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Comments();
                }));
              },
            );
          },
          itemCount: postNotifier.postList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.black,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            postNotifier.currentPost = null;
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context ){
                    return Comments();})
                    );
                    },
                    child: Icon(Icons.add),
                    foregroundColor: Colors.white,

                     ),
        );
  }
}
