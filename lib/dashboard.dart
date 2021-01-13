import 'dart:convert';

import 'package:bloggy/photos.dart';
import 'package:bloggy/profile.dart';
import 'package:bloggy/settings.dart';
import 'package:bloggy/showposts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'groups.dart';
import 'homepage.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}



class _DashboardState extends State<Dashboard> {
  createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Do you want to log out?', style: TextStyle(color: Colors.blue),),
        actions: <Widget>[
          MaterialButton(
          child: Text('Cancel'),
            onPressed: (){
            Navigator.pop(context);
            },
      ),
          MaterialButton(
            child: Text('Yes'),
            onPressed: () async {
              SharedPreferences prefs= await SharedPreferences.getInstance();
              prefs.remove('login');
              // log.currentState.showSnackBar(SnackBar(content: Text("You are being logged out."),));
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
            }
            ,
          )

        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.pink,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () async {
                  createAlertDialog(context);

                },
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Image(
                    image: NetworkImage('https://nerdynikhil.tech/bloggy/logo.png'),
                  height: 105,
                  width: 105,),
                  //Text('Bloggy',style: TextStyle(color: Colors.white),),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[900]
              ),
            ),
            ListTile(
              title: Text('App Info',style: TextStyle(fontWeight: FontWeight.w500),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => About()));
              },
            ),
            ListTile(
              title: Text('Privacy Policy',style: TextStyle(fontWeight: FontWeight.w500),),
              onTap: _launchURL,
            ),
            ListTile(
              title: Text('Terms and Conditions',style: TextStyle(fontWeight: FontWeight.w500),),
              onTap: _launchURLT ,
            ),

          ],
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Text("Hello, ", style: TextStyle(fontSize: 28,color: Colors.white),),
                FutureBuilder(
                  builder: (context,snapshot){
                    if(snapshot.hasData) {
                      String res = snapshot.data;
                      var jsonObject = json.decode(res);
                      return Text('${jsonObject['name']}',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white
                        ),
                      );
                    }
                    else
                      return Center(child: CircularProgressIndicator());
                  },
                  future: getData(),
                ),
                Text('!', style: TextStyle(fontSize: 28,color: Colors.white),)
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Profile()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width*0.45,
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.only(left: 20,),
                    color: Colors.green,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.account_circle,color: Colors.white,),
                      Text('Profile',style: TextStyle(color: Colors.white, fontSize: 25),)
                    ],
                    )

                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ShowPosts()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width*0.45,
                  child: Card(
                      elevation: 5,
                      margin: EdgeInsets.only(left: 20,),
                      color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.assignment,color: Colors.white,),
                          Text('Posts',style: TextStyle(color: Colors.white, fontSize: 25),)
                        ],
                      )

                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Photos()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width*0.45,
                  child: Card(
                      elevation: 5,
                      margin: EdgeInsets.only(left: 20,),
                      color: Colors.purple,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.photo_library,color: Colors.white,),
                          Text('Photos',style: TextStyle(color: Colors.white, fontSize: 25),)
                        ],
                      )

                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Groups()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width*0.45,
                  child: Card(
                      elevation: 5,
                      margin: EdgeInsets.only(left: 20,),
                      color: Colors.blue[800],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.group_add,color: Colors.white,),
                          Text('Groups',style: TextStyle(color: Colors.white, fontSize: 25),)
                        ],
                      )

                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Settings()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width*0.45,
                  child: Card(
                      elevation: 5,
                      margin: EdgeInsets.only(left: 20,),
                      color: Colors.teal[800],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.settings,color: Colors.white,),
                          Text('Settings',style: TextStyle(color: Colors.white, fontSize: 25),)
                        ],
                      )

                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://sites.google.com/view/bloggypolicy/home';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLT() async {
    const url = 'https://sites.google.com/view/bloggytnc/home';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("login")??'0';
    String url = 'https://nerdynikhil.tech/test/profile.php?id=';
    var result = await http.get(url+id);
    return result.body;
  }
}
