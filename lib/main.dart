import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            child: RaisedButton(
              onPressed: null,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [buttonGradientStartColor, buttonGradientEndColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Center(
                  child: Text(
                    "Add new sleeping record",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ),
            )
          ),
          Container(
            height: 100.0,
          ),
          Text(
            widget.dateText,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
