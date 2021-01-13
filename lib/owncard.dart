import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bloggy/posts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class OwnCard extends StatefulWidget {
  Posts post;
  OwnCard(this.post);

  @override
  _OwnCardState createState() => _OwnCardState();
}

class _OwnCardState extends State<OwnCard> {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetails()));
      },
      child: Card(
          elevation: 10,
          margin: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.post.title, style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                    margin: EdgeInsets.only(left: 5),
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.blue
                    ),
                    child: Text(widget.post.body)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Time: ' + widget.post.time),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Posted by '+ widget.post.name),
                    ],
                  ),
                ),
       // Text('Post ID :'+ widget.post.id),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                          context: context,
                      builder: (context)=>AlertDialog(
                        content: Text('Do you really want to delete this post?'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: (){
                              delete();
                            },
                            child: Text('Yes, delete'),
                          )
                        ],
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
                      Icon(Icons.delete, color: Colors.red[800],),
                      Text('Delete', style: TextStyle(color: Colors.pink),)
                    ],),
                  ),
                )




              ]
          )
      ),
    );
  }

  delete() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String postId= widget.post.id;
    final result= await http.get('https://nerdynikhil.tech/test/deletePost.php?id=$postId');
    final jsonObject = json.decode(result.body);
    if(jsonObject['result'])
      Navigator.pop(context);
    else
      print(jsonObject['reason']);
  }
}
