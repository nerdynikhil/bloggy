import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:Stack(
        children: <Widget>[
          Container(
            alignment: Alignment(0,0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2.5,
            color: Colors.white54,
            child: Image(image: NetworkImage('https://nerdynikhil.tech/bloggy/logo.png'),
            height: 150,
            width: 150,)
          ),
//          Container(
//            padding: EdgeInsets.only(top:1),
//            margin: EdgeInsets.only(top: 160,left: 160),
//            child: Text('   App info   '),
//            decoration: BoxDecoration(
//              border: Border.all(color: Colors.black87),
//              borderRadius: BorderRadius.circular(50.0),
//            ),
//          ),
          Container(
            alignment: Alignment(0, -0.36),
            child: Text('Version 1.2', style: TextStyle(fontSize: 10),),
          ),

          Container(
            alignment: Alignment(-0.74, 0.1),
            child: Text('Auto update Bloggy app'),
          ),
          Container(
            alignment: Alignment(-0.79, 0.17),
            child: Text('Using Wi-Fi only',
              style: TextStyle(
                color: Colors.lightBlue,fontWeight: FontWeight.w600,fontSize:12.0,
              ),),
          ),
          Container(
            alignment: Alignment(-0.79, 0.3),
            child: Text('Privacy Policy',style: TextStyle(
                fontWeight: FontWeight.w400
            ),),
          ),
          Container(
            alignment: Alignment(-0.76, 0.4),
            child: Text('Terms and Conditions',style: TextStyle(
                fontWeight: FontWeight.w400
            ),),
          ),

          Container(
            alignment: Alignment(-0.01, 0.7),
            child: Text('Made with ❤ in India. ',style: TextStyle(fontSize: 12
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35,right: 35),
            child: Container(
              alignment: Alignment(-0.01, 0.6),
              child: Text('Bloggy is now in developmental state and only scratches the surfaces of how the final app will be. Please bear with us. Thanks :) ',style: TextStyle(fontSize: 12
              , fontStyle: FontStyle.italic),),
            ),
          ),
          Container(
            alignment: Alignment(0, 0.85),
            child: Text('© nerdynikhil. 2021. ALL RIGHTS RESERVED.',style: TextStyle(
              fontWeight: FontWeight.w600,fontSize: 10.0,color: Colors.lightBlue,
            ),),
          ),
        ],
      ),
    );
  }
}
