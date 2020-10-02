import 'package:flutter/material.dart';
import 'about.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.teal[800],),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            subtitle: Text('Privacy, security, change email'),
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Notifications'),
            subtitle: Text('Lockscreen and vibration'),
          ),
          ListTile(
            onTap: _launchURLA,
            leading: Icon(Icons.help_outline),
            title: Text('Help'),
            subtitle: Text('FAQ, contact us'),
          ),
          ListTile(onTap: (){
            Navigator.push(context, MaterialPageRoute(
            builder: (context) => About()));
            },
          leading: Icon(Icons.info_outline),
          title: Text('App info'),
            subtitle: Text('Version, check for updates'),
          ),
          ListTile(
            onTap: _launchURL,
            leading: Icon(Icons.people),
            title: Text('Invite a friend'),
          ),

        ],
      ),
    );
  }
  _launchURL() async {
    const url = "http://studentmate.site/aboutme/bloggy/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLA() async {
    const url = "http://studentmate.site/aboutme/bloggy/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



}
