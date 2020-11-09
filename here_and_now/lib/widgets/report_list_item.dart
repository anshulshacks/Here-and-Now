import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/report.dart';
import './details.dart';

class ReportListItem extends StatelessWidget {
  final Report report;

  ReportListItem(this.report);

  @override
  Widget build(BuildContext context) {
    void showInfo(String title, String description, String date, String time) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              title: '$title',
              description: '$description',
              date: '$date',
              time: '$time',
            ),
          ));
    }

    return GestureDetector(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: ListTile(
            title: Text(
              '${report.title}',
            ),
            subtitle: Text(
              '${report.date}',
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () => showInfo(
                  report.title, report.description, report.date, report.time),
            )),
      ),
      onTap: () {
        print('Hey it works');
      },
    );
  }
}
