import 'package:flutter/material.dart';

final Color hourBackgroundColor = Color(0xfff7f6f3);

class SleepRecordItem extends StatelessWidget {
  final String hour;
  final String title;
  final String subtitle;

  SleepRecordItem(
      {@required this.hour, @required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 70,
          child: Row(
            children: <Widget>[
              Container(
                width: 70,
                color: hourBackgroundColor,
                child: Center(
                  child: Text(
                    hour,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          color: Color(0xff00287D),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(height: 4.0),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 0.0,
        )
      ],
    );
  }
}
