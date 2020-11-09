import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './report_list_item.dart';
import '../models/report.dart';

class ReportList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Report> _reports = [];
    final report = Provider.of<QuerySnapshot>(context);
    for (var doc in report.documents) {
      var reportsItem = Report(
        title: doc.data['title'],
        description: doc.data['description'],
        date: doc.data['date'],
        time: doc.data['time'],
      );
      _reports.add(reportsItem);
    }

    return _reports.isEmpty
        ? Column(
            children: [
              Text('No reports yet!'),
              SizedBox(height: 30),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        // : ListView.builder(
        //   itemBuilder: (cx, index) {
        //     return ReportListItem(reports[index]);
        //   },
        //   itemCount: reports.length,
        // )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return ReportListItem(
                _reports[index],
              );
            },
            itemCount: _reports.length,
          );
  }
}
