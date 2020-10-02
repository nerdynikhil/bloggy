import 'package:flutter/material.dart';
import 'addpost.dart';
import 'allposts.dart' as posts;
import 'myposts.dart' as myposts;

class ShowPosts extends StatefulWidget {
  @override
  _ShowPostsState createState() => _ShowPostsState();
}

class _ShowPostsState extends State<ShowPosts> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink, title: Text('Posts'),
        bottom: TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab (text: 'All posts',),
            Tab (text: 'My posts',),
          ],
        ),),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPost()));
          }, icon: Icon(Icons.add),label: Text('Add new')),
      body:
      TabBarView(
          controller: controller,
          children: <Widget>[
            posts.AllPosts(),
            myposts.MyPosts(),
          ])
      ,
    );
  }
}
