import 'dart:convert';

import 'package:bloggy/showposts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  TextEditingController _titleController, _bodyController;
  GlobalKey<ScaffoldState> _myKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  submit();
                },
                child: Icon(Icons.check)),
          )
        ],
        title: Text('Compose post'),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
            padding: EdgeInsets.only(
                left: 20
            ),
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  hintText: 'Caption',
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.title,
                    color: Colors.pink,)
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  )
                ]
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
            padding: EdgeInsets.only(
                left: 20
            ),
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: TextField(
              controller: _bodyController,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Description',
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.description,
                    color: Colors.pink,)
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  )
                ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  Text('Posting as ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  FutureBuilder(
                  builder: (context,snapshot){
                  if(snapshot.hasData) {
                  String res = snapshot.data;
                  var jsonObject = json.decode(res);
                  return Text(
                  '${jsonObject['name']}',
                  style: TextStyle(
                  fontSize: 18,
                  color: Colors.pink
                  ),
                  );
                  }
                  else
                  return Center(child: CircularProgressIndicator());
                  },
                  future: getData(),
                  )
                  ],
                  ),
          )


        ],
      ),
    );
  }
  submit() async{
    String title = _titleController.text;
    String body = _bodyController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("login")??'0';
    String url =  'http://studentmate.site/aboutme/bloggy/APIs/addPost.php?id=$id&title=$title&body=$body';
    var response = http.get(url);
    response.then((response) {
      var data = json.decode(response.body);
      bool value = data['result'];
      if(value){
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (BuildContext context) => ShowPosts()));
      }
      else{
        String reason = data['reason'];
        _myKey.currentState.showSnackBar(SnackBar(content: Text('$reason')));
      }
    });

  }


  getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("login")??'0';
    String url = 'http://flutter.smarttersstudio.com/test/profile.php?id=';
    var result = await http.get(url+id);
    return result.body;
  }
}
