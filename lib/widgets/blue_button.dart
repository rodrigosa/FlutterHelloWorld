import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  String text;
  Function onPressed;

  BlueButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
