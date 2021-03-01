import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _button(),
          _button(),
          _button()
        ],
      ),
    );
  }

  _text() {
    return Text(
      "Hello World!",
      style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _button() {
    return ElevatedButton(
      child: Text("OK"),
      onPressed: () => _onclickOK(),
    );
  }

  void _onclickOK(){
    print("Clicou no botão!");
  }

  _img() {
    return Image.asset(
      "assets/images/dog1.png",
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }
}
