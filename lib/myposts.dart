import 'dart:convert';

import 'package:bloggy/posts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'owncard.dart';

class MyPosts extends StatefulWidget {
  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (val, index) =>
                  OwnCard(snapshot.data[index])
          );
        }
        else
          return Center(child: CircularProgressIndicator());
      },
      future: getData(),
    );
  }

  Future<List<Posts>> getData() async {
    SharedPreferences pref= await SharedPreferences.getInstance();
    String id=pref.getString('login');
    // var response = await http.get(
    //     'https://nerdynikhil.tech/test/getMyPosts.php?id=$id');
    var response = await http.get(Uri.parse('https://nerdynikhil.tech/test/getMyPosts.php?id=$id'));
    var jsonData = json.decode(response.body);
    return List<Posts>.from(jsonData.map((x) =>
        Posts(
            id: x['id'],
            name: x['name'],
            title: x['title'],
            body: x['description'],
            time: x['timestamp']
        )));
  }
}
