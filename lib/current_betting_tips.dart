import 'package:flutter/material.dart';

class betgodAbout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return betgodAboutState();
  }
}

class betgodAboutState extends State<betgodAbout> {
  double m_size = 17.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Info."),
        ),
        body: Center(
            child: Text(
          "App. developed by"
              " Awuah Darko.\nContact: 0553567136"
              "\nEmail: mjadarko@gmail.com",
          style: TextStyle(color: Colors.black, fontSize: m_size),
        )));
  }
}
