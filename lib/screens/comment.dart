import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:picflowapp/Notifer/Notifer_post.dart';
import 'package:provider/provider.dart';

class Comments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostNotifier postNotifier =
        Provider.of<PostNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(postNotifier.currentPost.caption),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(postNotifier.currentPost.image),
              SizedBox(
                height: 32,
              ),
              Text(
                postNotifier.currentPost.caption,
                style: TextStyle(fontSize:20 ),
              ),
              Text(postNotifier.currentPost.about,
              style: TextStyle(fontSize:15,fontStyle: FontStyle.italic ),),
              GridView.count(
                padding: EdgeInsets.all(8),
                crossAxisCount: 8, 
              crossAxisSpacing:4,
              mainAxisSpacing:4,
              children: postNotifier.currentPost.category.map(
                // TODO: review this part
                ((category)=>Card(
                  color: Colors.black54,
                  child: Center(
                    child:Text(
                      category,style: TextStyle(
                        color: Colors.white,fontSize: 16),
                        ),
                        ),

                )),).toList()
              )

            ],
          ),
        ),
      ),
    );
  }
}
