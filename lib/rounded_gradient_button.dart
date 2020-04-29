import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color buttonGradientStartColor = Color(0xff00287D);
Color buttonGradientEndColor = Color(0xff0279C9);

class RoundedGradientButton extends StatelessWidget {

  final onPressedListener;
  final text;

  RoundedGradientButton({
    this.onPressedListener,
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressedListener,
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
              text,
              style: TextStyle(color: Colors.white),
            ),
          )
      ),
    );
  }
}