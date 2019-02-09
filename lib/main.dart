import 'package:flutter/material.dart';
import './old_betting_tips.dart';
import './current_betting_tips.dart';
import './allimages.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "betGod",
      home: betGod(),
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.orange,
      ),
    ));

class betGod extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _betgodState();
  }
}

class _betgodState extends State<betGod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("betGod Home")),
        body: Container(
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: AssetImage("images/golgen.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.amber.withOpacity(0.5), BlendMode.dstATop),
              ),
            ),
            padding: EdgeInsets.only(top: 20.0),
            child: Center(
                child: Column(children: <Widget>[
              betGodLogo(),
              RaisedButton(
                  child: Text("Betting tips"),
                  color: Colors.amberAccent,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return betgodCurrent();
                    }));
                  }),
              RaisedButton(
                  child: Text("betGod Premium"),
                  color: Colors.limeAccent,
                  onPressed: () {
                    _launchURL();
                  }),
              RaisedButton(
                  child: Text("App Info"),
                  color: Colors.amber,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return betgodAbout();
                    }));
                  }),
            ]))));
  }

  void _launchURL() async {
    const url = 'https://t.me/betgodsure2odds';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
