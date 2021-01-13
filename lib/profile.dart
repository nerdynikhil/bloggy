import 'dart:convert';

import 'package:bloggy/profileview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text('Profile')
      ),
          body: FutureBuilder(
            builder: (context,snapshot){
              if(snapshot.hasData){
                String res = snapshot.data;
                var jsonObject = json.decode(res);
                return ProfileView(
                  name: jsonObject['name'],
                  phone: jsonObject['phone'],
                  email: jsonObject['email'],
                  gender: (jsonObject['gender']=='1')?'Male':'Female',
                );
              }
              else
                return Center(child: CircularProgressIndicator(),);
            },
            future: getData(),
          ),
    );
  }

  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("login")??"0";
    String url = 'https://nerdynikhil.tech/test/profile.php?id=';
    var result = await http.get(url+id);
    return result.body;
  }
}
