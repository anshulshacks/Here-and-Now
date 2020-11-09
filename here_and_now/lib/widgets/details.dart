import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String time;
  DetailsPage({this.title, this.description, this.date, this.time});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$title',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          left: 10,
          right: 10,
          bottom: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              '$title',
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10
            ),
            Text(
              '$description',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Posted on $date at $time',
              style: TextStyle(
                fontFamily: 'OpenSans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
