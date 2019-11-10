import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nutricar_app/main.dart';
import 'package:nutricar_app/models/scheduleModel.dart';
import 'package:nutricar_app/widget_view/floorlist.dart';
import 'package:nutricar_app/widget_view/productlist.dart';
import 'package:nutricar_app/widget_view/timetablepage.dart';

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
      home: Material(
        child: Column(
          children: <Widget>[ Expanded(child: headerInfo(context))
            ],
        ),
      ),
    );
  }

  static Widget divider = Container(
      child: Row(
    children: <Widget>[
      Expanded(
          child: Divider(
        color: Colors.black,
      ))
    ],
  ));

  Widget headerInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Boa Tarde, Pessoal!!',
                      style: TextStyle(
                          color: hexToColor('#2DA901'),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),

          /*3*/
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Stack(
              children: <Widget>[

                Column(
                  children: <Widget>[
                    Container(
                      child: Container(
                          child: FloorList()
                      ),
                    )
                  ],
                )
//                Padding(
//                  padding: EdgeInsets.only(top: 52, left: 32),
//                  child: Container(
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Atualmente está\n no andar nº',
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontSize: 24,
//                                fontWeight: FontWeight.bold)),
//                      ],
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: 132),
//                  child: Column(
//                    children: <Widget>[
//                      Container(
//                        child: Container(
//                          color: hexToColor('#2DA901'),
//                          width: MediaQuery.of(context).size.width,
//                          height: 220,
//                          child: Text('',
//                              style: TextStyle(
//                                  fontSize: 128, color: Colors.white)),
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: 124, left: 32),
//                  child: Container(
//                    child: Row(
//                      children: <Widget>[
//                        Text('6',
//                            style:
//                                TextStyle(fontSize: 128, color: Colors.white))
//                      ],
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: 260, left: 32),
//                  child: Container(
//                    child: Row(
//                      children: <Widget>[
//                        Text('Até 15:20',
//                            style: TextStyle(
//                                fontSize: 32,
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold))
//                      ],
//                    ),
//                  ),
//                ),
//                Container(
//                    child: Row(
//                  mainAxisSize: MainAxisSize.max,
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  children: <Widget>[
//                    Image.asset('assets/icons/cart.png',
//                        width: 215, height: 366),
//                  ],
//                )),
//                Padding(
//                  padding: EdgeInsets.only(top: 300),
//                  child: FloorList(),
//                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget createTimeTableWidget(List<scheduleModel> _lstScheduleRegister,  int Index){
    return  Container(
      padding: const EdgeInsets.all(0),
      child: Row(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: Center(
              child: Text(_lstScheduleRegister[Index].floor,
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: Center(
              child: new Text(_lstScheduleRegister[Index].hours)),
        )
      ]),
      color: (Index % 2 == 0) ? Colors.grey[300] : Colors.white,
    );
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
