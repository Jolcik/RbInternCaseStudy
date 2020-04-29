import 'package:easy_dialogs/easy_dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rbcasestudyapp/add_record_page_row_item.dart';
import 'package:rbcasestudyapp/rounded_gradient_button.dart';
import 'package:rbcasestudyapp/sleep_record.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordPage extends StatefulWidget {
  final List<SleepRecord> records;

  final List<String> _sleepTypes = [
    "Night's sleep",
    "Nap"
  ];

  AddRecordPage({@required this.records});

  @override
  State createState() => AddRecordPageState();
}

class AddRecordPageState extends State<AddRecordPage> {
  final _recordDate = DateTime.now();
  String _sleepType;
  int _sleepDurationInMinutes;

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Sleeping tracker",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white
          ),
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
                  subtitle: DateFormat("d MMMM yyyy, HH:mm").format(_recordDate)),
              AddRecordPageRowItem(
                icon: Icons.airline_seat_individual_suite,
                title: "Sleep type",
                subtitle: _getSleepTypeSubtitle(),
                onPressed: _addSleepType,
              ),
              AddRecordPageRowItem(
                icon: Icons.access_time,
                title: "Sleep duration",
                subtitle: _getSleepDurationSubtitle(),
                onPressed: _addSleepDuration,
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 48.0),
                child: RoundedGradientButton(
                  text: "Save",
                  onPressedListener: () => _addSleepRecordAndPop(),
                ),
              )
            ],
          ),
        ));
  }

  String _getSleepTypeSubtitle(){
    if(_sleepType != null)
      return _sleepType;
    else
      return "Night, nap, etc";
  }

  String _getSleepDurationSubtitle() {
    if (_sleepDurationInMinutes != null)
      return "$_sleepDurationInMinutes minutes";
    else
      return "...";
  }

  void _addSleepType() {
    showDialog(
        context: _context,
        builder: (_context) => SingleChoiceDialog<String>(
          title: Text("Choose sleep type:"),
          items: widget._sleepTypes,
          onSelected: (String type) {
            setState(() => _sleepType = type);
          },
        )
    );
  }

  void _addSleepDuration() {
    showDialog<int>(
        context: _context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            minValue: 1,
            maxValue: 1000,
            title: new Text("Pick sleep duration time in minutes"),
            initialIntegerValue: 90,
          );
        }).then((int value) {
      if (value != null) {
        setState(() {
          _sleepDurationInMinutes = value;
        });
      }
    });
  }

  void _addSleepRecordAndPop() {
    if (_sleepType != null && _sleepDurationInMinutes != null) {
      widget.records.insert(0, SleepRecord(
          date: _recordDate,
          type: _sleepType,
          durationInMinutes: _sleepDurationInMinutes));
      Navigator.pop(_context);
    }
  }
}
