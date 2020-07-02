import 'package:flutter/material.dart';
import 'package:picflowapp/posts/posts.dart';
import 'package:provider/provider.dart';
import 'package:picflowapp/Notifer/Notifer_post.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  // TODO:  also reveiw this part
  List _category =[];
  Post _currentPost;

  @override
  void initState(){
    super.initState();
    PostNotifier postNotifier = Provider.of<PostNotifier>(context,listen: false);
     if(postNotifier.currentPost != null)
     {_currentPost= postNotifier.currentPost;}
     else{_currentPost = Post();}
  }



   Widget _showImage(){return Text('show Image Here');}
   Widget  _buildCaptionFeild(){
     return TextFormField(
       decoration: InputDecoration(labelText: 'Caption' ),
       // also reveiw c.c 15.09
       initialValue: _currentPost.caption,
       keyboardType:TextInputType.text,
       style: TextStyle(fontSize:20),
       validator: (String value){if(value.isEmpty){
         return 'Kindly input Caption';
         }
         if(value.length< 3 || value.length>60 ){
           return 'Caption should have more than 3charaters and less than 60';}
           return null;
         },
         onSaved: (String value){
           _currentPost.caption =value;
         },
     );
   }
    Widget  _buildCategoryFeild(){
      return TextFormField(
       decoration: InputDecoration(labelText: 'Category' ),
       //also review br
       initialValue: _currentPost.about,
       keyboardType:TextInputType.text,
       style: TextStyle(fontSize:20),
       validator: (String value){if(value.isEmpty){
         return 'category is required';
         }
         if(value.length< 3 || value.length>60 ){
           return 'caption should have more than 3charaters and less than 60';}
           return null;
         },
         onSaved: (String value){
           _currentPost.caption =value;
         },
     );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title:Text('UploadPage',),centerTitle: true,),
    body: Center(
      child: SingleChildScrollView(
        child:Form(
          key: _formKey,autovalidate: true ,
          child: Column(children: <Widget>[
            _showImage(),
            SizedBox(height:15),
            Text('create Post',textAlign: TextAlign.center,style: TextStyle(fontSize:20),),
            SizedBox(height:15),
            ButtonTheme(child: RaisedButton(
              child: Text(
                'add image',style: TextStyle(fontSize:20),),
                
              onPressed: (){},
              ),
              ),
               _buildCaptionFeild(),
                _buildCategoryFeild(),
                SizedBox(height:15),

            GridView.count(
                padding: EdgeInsets.all(8),
                crossAxisCount: 8, 
              crossAxisSpacing:4,
              mainAxisSpacing:4,
              children: _category.map(
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
          )
          ,),
      
      ),
    ),
    );
  }
}