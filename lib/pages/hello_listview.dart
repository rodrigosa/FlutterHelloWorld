import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png")
    ];

    return GridView.builder(
      itemCount: dogs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        Dog dog = dogs[index];
        return Stack(
          fit: StackFit.expand,

          /// Pode-se usar também o SizedBox.expand()
          children: [
            _img(dog.foto), /// Nesta ordem a foto fica por baixo do nome
            Container( /// Ao inv[es de Container pode-se usar também o widget Align, porém o Container possui mais recursos
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  /// O Black45 possui 45% de opacidade
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Text(
                  dog.nome,
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
