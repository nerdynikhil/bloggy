import 'package:flutter/material.dart';

class Photos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image(
              width: 170,
            height: 170,
            image: NetworkImage('https://images.unsplash.com/photo-1502759683299-cdcd6974244f?auto=format&fit=crop&w=440&h=220&q=60'),
    ),
          ),
    Image(
          width: 170,
          height: 170,
    image: NetworkImage('https://images.unsplash.com/photo-1586482509563-53a78f357ad6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
    ),

                ],
              ),
              Row(
                children: <Widget>[
    Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Image(
            width: 170,
            height: 170,
      image: NetworkImage('https://images.unsplash.com/photo-1559677418-326e327ad3a3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
      ),
    ),
    Image(
          width: 170,
          height: 170,
    image: NetworkImage('https://cdn.statically.io/img/images.unsplash.com/photo-1513043450637-a4b4b9bca660?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
    ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image(
                      width: 170,
                      height: 170,
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSeaffuEi_uVumyrs-ToAqcLBMqlfsv_gjsaw&usqp=CAU'),
                    ),
                  ),
                  Image(
                    width: 170,
                    height: 170,
                    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwi-Hs01J-tYUn_K8Yn9CbpWqejjRQDzMsjw&usqp=CAU'),
                  ),

                ],
              ),
//              Row(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(right: 8.0),
//                    child: Image(
//                      width: 170,
//                      height: 170,
//                      image: NetworkImage('https://lecturenotes.in/assets/img/internship2018/8.jpeg'),
//                    ),
//                  ),
//                  Image(
//                    width: 170,
//                    height: 170,
//                    image: NetworkImage('https://lecturenotes.in/assets/img/internship2018/9.jpeg'),
//                  ),
//                ],
//              ),
//              Row(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(right: 8.0),
//                    child: Image(
//                      width: 170,
//                      height: 170,
//                      image: NetworkImage('https://lecturenotes.in/assets/img/internship2018/10.jpeg'),
//                    ),
//                  ),
//                  Image(
//                    width: 170,
//                    height: 170,
//                    image: NetworkImage('https://lecturenotes.in/assets/img/internship2018/11.jpeg'),
//                  ),
//
//                ],
//              ),
//              Row(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(right: 8.0),
//                    child: Image(
//                      width: 170,
//                      height: 170,
//                      image: NetworkImage('https://lecturenotes.in/assets/img/internship2018/12.jpeg'),
//                    ),
//                  ),
//                  Image(
//                    width: 170,
//                    height: 170,
//                    image: NetworkImage('https://lecturenotes.in/assets/img/internship2018/13.jpeg'),
//                  ),
//                ],
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
