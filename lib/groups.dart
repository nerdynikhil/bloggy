import 'package:flutter/material.dart';

class Groups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width,
              child: Card(
                  elevation: 5,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.group,color: Colors.white,),
                      Text('Geeklords',style: TextStyle(color: Colors.white, fontSize: 25),),
                      Text('Nikhil, Harsh and Pranay joined this group',style: TextStyle(color: Colors.white))
                    ],
                  )

              ),
            ),
            Container(
             height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width,
              child: Card(
                  elevation: 5,
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.group,color: Colors.white,),
                      Text('Codevengers',style: TextStyle(color: Colors.white, fontSize: 25),),
                      Text('Ashutosh, Garima and Tanmay joined this group',style: TextStyle(color: Colors.white)),
                    ],
                  )

              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width,
              child: Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.group,color: Colors.white,),
                      Text('Noob Coders',style: TextStyle(color: Colors.white, fontSize: 25),),
                      Text('Preetam and Vanshika joined this group',style: TextStyle(color: Colors.white)),
                    ],
                  )

              ),
            )

          ],
        ),
      )
    );
  }
}
