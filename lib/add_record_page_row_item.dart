import 'package:flutter/material.dart';

Color buttonGradientStartColor = Color(0xff00287D);

class AddRecordPageRowItem extends StatelessWidget {

  final icon;
  final title;
  final subtitle;
  final onPressed;

  AddRecordPageRowItem({
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    this.onPressed
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 70.0,
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Icon(
                  icon,
                  color: buttonGradientStartColor,
                )
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
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.black54, fontSize: 16.0),
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