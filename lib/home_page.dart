import 'package:flutter/material.dart';
import 'package:flutter_hello1/pages/hello_page1.dart';
import 'package:flutter_hello1/pages/hello_page3.dart';
import 'package:flutter_hello1/widgets/blue_button.dart';

import 'pages/hello_page2.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context)
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
          height: 300,
          child: PageView(
            children: [
              _img("assets/images/dog1.png"),
              _img("assets/images/dog2.png"),
              _img("assets/images/dog3.png"),
              _img("assets/images/dog4.png"),
              _img("assets/images/dog5.png")
            ],
          ),
        );
  }

  _buttons(BuildContext context) {
    return Column(
      children: [
        ///Testando componente BlueButton criado
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlueButton( "ListView", () => _onClickNavigator(context, Hellopage1())),
            BlueButton( "Page 2", () => _onClickNavigator(context, Hellopage2())),
            BlueButton( "Page 3", () => _onClickNavigator(context, Hellopage3()))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _button(context, "Snack", _onclickSnack),
            _button(context, "Dialog", _onClickDialog),
            _button(context, "Touch", _onClickToast)
          ],
        ),
      ],
    );
  }

  /// Navigator.push -> Navega entre telas
  /// String s recebe parametro passado pelo componente que chama o _onClickNavigator
  /// Sempre que usar await deve se ter o async declarado no metodo
  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return page;
    }));

    /// Imrime o valor recebido em S
    print(">> $s");
  }

  _onclickSnack() {
  }

  _onClickDialog() {
  }

  _onClickToast() {
  }

  _button(BuildContext context, String text, Function onPressed) {
    return ElevatedButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: onPressed
    );
  }


  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

}
