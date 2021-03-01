import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  String text;
  Function onPressed;
  Color color;

  /// Os parametros dentro das chaves são opcionais
  /// Se eu não informar a cor ela será azul por padrão (this.color = Colors.blue)
  BlueButton(this.text, {@required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
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
