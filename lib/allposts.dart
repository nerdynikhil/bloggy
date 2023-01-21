import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'posts.dart';

import 'mycard.dart';

class AllPosts extends StatefulWidget {
  @override
  _AllPostsState createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (val, index) =>
                  MyCard(snapshot.data[index])
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
    //     'https://nerdynikhil.tech/test/getAllPosts.php?id=');
    var response = await http.get(Uri.parse('https://nerdynikhil.tech/test/getAllPosts.php?id='));
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


