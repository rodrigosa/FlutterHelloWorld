import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hellopage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: _body(context),
    );
  }

  ///Leiaute da tela
  _body(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: Text("Voltar"),
          onPressed: () => _onClockVoltar(context)),
    );
  }

  _onClockVoltar(BuildContext context) {
    Navigator.pop(context, "Tela 3");
  }
}
