import 'package:flutter/material.dart';
import 'package:flutter_hello1/pages/hello_listview.dart';
import 'package:flutter_hello1/pages/hello_page3.dart';
import 'package:flutter_hello1/utils/nav.dart';
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
          _buttons(),
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

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: [
            ///Testando componente BlueButton criado
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, Hellopage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, Hellopage3()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _button(context, "Snack", () => _onclickSnack(context)),
                _button(context, "Dialog", () => _onClickDialog(context)),
                _button(context, "Touch", _onClickToast)
              ],
            ),
          ],
        );
      },
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    /// Imrime o valor recebido em S
    print(">> $s");
  }

  _onclickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
        textColor: Colors.yellow,
        label: 'OK',
        onPressed: () {
          print("OK!");
        },
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, // Para não fechar a caixa de dialogo clicando fora
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Flutter é muito legal"),
              actions: [
                TextButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);// Sempre para fechar o Dialog chamar o POP
                    print("OK!!!");
                  },
                )
              ],
            ),
          );
        });
  }

  _onClickToast() {}

  _button(BuildContext context, String text, Function onPressed) {
    return ElevatedButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: onPressed);
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
