import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import './models/report.dart';
import './widgets/report_list.dart';
import './widgets/add.dart';

// () async {
//           await _db.collection('books').document().setData({
//             'content': 'Hey',
//             'timestamp': 'time',
//           });
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Here and Now',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.black,
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Firestore _db = Firestore.instance;
  final CollectionReference reportCollection =
      Firestore.instance.collection("reports");
  Stream<QuerySnapshot> get report {
    return reportCollection.snapshots();
  }

  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: report,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Here and Now',
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPage()),
                );
              },
            )
          ],
        ),
        body: ReportList(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPage()),
            );
          },
        ),
      ),
    );
  }
}
