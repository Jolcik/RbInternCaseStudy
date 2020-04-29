import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rbcasestudyapp/add_record_page.dart';
import 'package:rbcasestudyapp/rounded_gradient_button.dart';
import 'package:rbcasestudyapp/sleep_record.dart';
import 'package:rbcasestudyapp/sleep_record_item.dart';

void main() => runApp(RbCaseStudyApp());

Color mainColor = Color(0xffFFBE43);
Color buttonGradientStartColor = Color(0xff00287D);
Color buttonGradientEndColor = Color(0xff0279C9);

class RbCaseStudyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RB Intern Case Study',
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      home: HomePage(title: 'RB Intern Case Study'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  final String dateText = DateFormat("EEEE, d MMM yyyy").format(DateTime.now()).toUpperCase();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _records = <SleepRecord>[];

  Widget _buildSleepRecordItem(SleepRecord record){
    return SleepRecordItem(
      hour: DateFormat("HH:mm").format(record.date),
      title: record.type,
      subtitle: _formatSleepDurationString(record.durationInMinutes),
    );
  }

  void _pushAddRecord(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context){
          return AddRecordPage(
            records: _records,
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>[
          Container(
            height: 100,
            child: Center(
                child: Icon(
                    Icons.timelapse,
                    color: mainColor,
                  size: 48,
                )
            ),
          ),
          Container(
            child: Center(
                child: Text("Get to know your baby's sleep patterns and keep\n track of how much sleep they are getting here.",)
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 32.0),
            child: RoundedGradientButton(
              text: "Add new sleeping record",
              onPressedListener: () => _pushAddRecord(),
            )
          ),
          Container(
            height: 100.0,
          ),
          Text(
            widget.dateText,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(
                vertical: 32.0
              ),
              child: Column(
                children: _records
                    .map((record) => _buildSleepRecordItem(record))
                    .toList(),
              )
          ),
        ],
      ),
    );
  }

  String _formatSleepDurationString(int durationInMinutes){
    int sleepHours = (durationInMinutes/60).floor();
    int sleepMinutes = durationInMinutes - 60 * sleepHours;

    String hoursString;
    if(sleepHours > 1)
      hoursString = "$sleepHours hours ";
    else if(sleepHours == 1)
      hoursString = "$sleepHours hour ";
    else
      hoursString = "";

    String minutesString;
    if(sleepMinutes > 1)
      minutesString = "$sleepMinutes minutes";
    else if(sleepMinutes == 1)
      minutesString = "$sleepMinutes minute";
    else
      minutesString = "";

    return hoursString + minutesString;
  }

}
