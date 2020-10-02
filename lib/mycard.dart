import 'package:flutter/material.dart';
import 'package:bloggy/posts.dart';

// ignore: must_be_immutable
class MyCard extends StatelessWidget {
  Posts post;
  MyCard(this.post);
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
                  child: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                    margin: EdgeInsets.only(left: 5),
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.blue
                    ),
                    child: Text(post.body)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Time: ' + post.time),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Posted by '+ post.name),
                )


              ]
          )
      ),
    );
  }
}
