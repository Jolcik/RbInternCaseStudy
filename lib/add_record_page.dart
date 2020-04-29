import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rbcasestudyapp/add_record_page_row_item.dart';
import 'package:rbcasestudyapp/rounded_gradient_button.dart';
import 'package:rbcasestudyapp/sleep_record.dart';

class AddRecordPage extends StatelessWidget {

  final records;

  AddRecordPage({
    @required this.records
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sleeping tracker"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset("assets/images/mother_with_child.jpg"),
            ),
            Container(
              height: 48.0,
            ),
            AddRecordPageRowItem(
                icon: Icons.calendar_today,
                title: "Date and time",
                subtitle: DateFormat("d MMMM yyyy, HH:mm").format(DateTime.now())
            ),
            AddRecordPageRowItem(
                icon: Icons.airline_seat_individual_suite,
                title: "Sleep type",
                subtitle: "Night, nap, etc"
            ),
            AddRecordPageRowItem(
                icon: Icons.access_time,
                title: "Sleep duration",
                subtitle: "..."
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 48.0),
              child: RoundedGradientButton(
                text: "Save",
                onPressedListener: () => _addSleepRecordAndPop(context),
              ),
            )
          ],
        ),
      )
    );
  }

  void _addSleepRecordAndPop(BuildContext context){
    records.add(SleepRecord(hour: "00:00", title: "Nap", subtitle: "2 hours 14 minutes"));
    Navigator.pop(context);
  }
}