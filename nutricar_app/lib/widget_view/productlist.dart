import 'package:flutter/material.dart';
import 'package:nutricar_app/models/carte.dart';

import 'cartecard.dart';

class ProductListPage extends StatefulWidget {
  ProductListPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: new ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: List.generate(choices.length, (index) {
                  return Center(
                    child:
                        CarteCard(choice: choices[index], item: choices[index]),
                  );
                }))));
  }
}

const List<Carte> choices = const <Carte>[
  const Carte(
      title: 'X-Tudo (2 hamburguers, alface, queijo e molho especial).',
      image: 'https://img.icons8.com/pastel-glyph/2x/hamburger.png'),
  const Carte(
      title: 'Café coado importado de Berlin.',
      image: 'https://img.icons8.com/pastel-glyph/2x/coffee.png'),
];
