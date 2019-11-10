import 'package:flutter/material.dart';
import 'package:nutricar_app/widget_view/productlist.dart';

class CartHomePage extends StatefulWidget {
  CartHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CartHomePageState createState() => _CartHomePageState();
}

class _CartHomePageState extends State<CartHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.ac_unit), text: 'Cliente',),
                  Tab(icon: Icon(Icons.ac_unit), text: 'Loja',)
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[headerInfo, ProductListPage()],
            )
        ),
      ),
    );
  }

  static Widget  divider = Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Divider(
                color: Colors.black,
              ))
        ],
      ));

  Widget headerInfo = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Nutricar está no:',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                    )
                  ],
                ),
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('5º',
                            style:
                            TextStyle(color: Colors.grey[500], fontSize: 64)),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 32.0),
                          child: Text('Até 18',
                              style:
                              TextStyle(color: Colors.red[500], fontSize: 18)),
                        ),
                      ])),
              divider
            ],
          ),
        ),
        /*3*/
      ],
    ),
  );
}
