import 'package:flutter/material.dart';

/// Navigator.push -> Navega entre telas
/// String s recebe parametro passado pelo componente que chama o _onClickNavigator
/// Sempre que usar await deve se ter o async declarado no metodo

Future push(BuildContext context, Widget page) {
  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
        return page;
      }));
}