import 'dart:convert';

import 'package:bloggy/showposts.dart';
import 'package:flutter/material.dart';
import 'package:bloggy/posts.dart';
import 'package:http/http.dart' as http;
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'owncard.dart';
import 'myposts.dart' as myposts;

class ProfileView extends StatelessWidget {

  String name, email, phone, gender;

  ProfileView({this.name, this.email, this.phone, this.gender});

  @override
  Widget build(BuildContext context) {
    return
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.green,
//              borderRadius: BorderRadius.only(
//                  bottomRight: Radius.circular(16),
//                  bottomLeft: Radius.circular(16)
//              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://cdn.pixabay.com/photo/2017/07/18/23/23/user-2517432_960_720.png")
                  ))
          )]),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$name', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
          ],
        ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
                children: <Widget>[
                  Icon(Icons.edit, color: Colors.white,),
                  Text('Edit profile', style: TextStyle(color: Colors.white),)
                ],
            ),
            Column(
                  children: <Widget>[
                    GestureDetector(onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPosts()));
                    },
                        child: Icon(Icons.chrome_reader_mode, color: Colors.white)),
                    Text('Posts', style: TextStyle(color: Colors.white),)
                  ]),
            Column(
                children: <Widget>[
                  Icon(Icons.group, color: Colors.white,),
                  Text('Groups joined', style: TextStyle(color: Colors.white),)
                ],
            )
          ],
        ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,top: 30),
                child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.email, color: Colors.white,),
            Text(email, style: TextStyle(color: Colors.white),)
          ],
        ),
              ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.face, color: Colors.white,),
              Text(gender, style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.phone, color: Colors.white,),
              Text(phone, style: TextStyle(color: Colors.white),)
            ],),
        ),


          ]
      ));
  }

}