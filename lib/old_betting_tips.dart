import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sqljocky5/connection/connection.dart';
import 'package:sqljocky5/connection/settings.dart';
import 'package:sqljocky5/results/results.dart';
import 'package:sqljocky5/sqljocky.dart';
import './allimages.dart';

class betgodCurrent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return betgodCurrentState();
  }
}

class betgodCurrentState extends State<betgodCurrent> {
  Results _result;

  Future<Results> doAll() async {
    var s = ConnectionSettings(
      user: "betgod",
      password: "natural@natural",
      host: "db4free.net",
      port: 3306,
      db: "betgoddatabase",
    );

    var conn = await MySqlConnection.connect(s);

    _result = await conn
        .execute('SELECT time,tips,selection,odds,results FROM betGod');

    /*print(_result);
    print('------------------------------------');
    print(_result.map((r) => r.byName('time')));
    print(_result.map((r) => r.byName('tips')));
    print(_result.map((r) => r.byName('selection')));
    print(_result.map((r) => r.byName('odds')));
    print(_result.map((r) => r.byName('results')));*/
    return _result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        title: Text("Betting tips"),
      ),
      body: FutureBuilder<Results>(
        future: doAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? Page(
                  result: snapshot.data,
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class Page extends StatelessWidget {
  Results result;

  Page({this.result});

  @override
  Widget build(BuildContext context) {
    double m_size = 17.0;
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: DecorationImage(
            image: AssetImage("images/stadium.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstOut),
          ),
        ),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,


              child: Column(children: <Widget>[
                Expanded(child:
                DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        "Time",
                        style: TextStyle(color: Colors.amber, fontSize: m_size),
                      ),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text(
                        "Tips",
                        style: TextStyle(color: Colors.amber, fontSize: m_size),
                      ),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text(
                        "Selection",
                        style: TextStyle(color: Colors.amber, fontSize: m_size),
                      ),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text(
                        "odds",
                        style: TextStyle(color: Colors.amber, fontSize: m_size),
                      ),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text(
                        "Results",
                        style: TextStyle(color: Colors.amber, fontSize: m_size),
                      ),
                      numeric: false,
                    ),
                  ],
                  rows: result
                      .map((result) => DataRow(cells: [
                            DataCell(Text(
                              result.byName("time").toString(),
                              style: TextStyle(
                                  color: Colors.tealAccent, fontSize: m_size),
                            )),
                            DataCell(Text(
                              result.byName("tips").toString(),
                              style: TextStyle(
                                  color: Colors.tealAccent, fontSize: m_size),
                            )),
                            DataCell(Text(
                              result.byName("selection").toString(),
                              style: TextStyle(
                                  color: Colors.tealAccent, fontSize: m_size),
                            )),
                            DataCell(Text(
                              result.byName("odds").toString(),
                              style: TextStyle(
                                  color: Colors.tealAccent, fontSize: m_size),
                            )),
                            DataCell(Text(
                              result.byName("results").toString(),
                              style: TextStyle(
                                  color: Colors.tealAccent, fontSize: m_size),
                            )),
                          ]))
                      .toList(),
                ),
                // Text(as),
                )]),
            ));
  }
}
