import 'package:flutter/material.dart';
import 'package:nutricar_app/models/scheduleModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimeTablePage extends StatefulWidget {
  TimeTablePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  //final databaseReference = FirebaseDatabase.instance.reference();
  int _counter = 0;
  SliverGrid _scheduleSliverGrid;
  List<String> _lstExample = ['Teste1', 'Teste2'];
  List<scheduleModel> _lstScheduleRegister = new List<scheduleModel>();

  _TimeTablePageState() {
    scheduleModel _sm = new scheduleModel(
        floor: '5o andar', hours: '12:00-13:00  16:00-17:00  20:00-21:00');
    _lstScheduleRegister.add(_sm);
    _sm = new scheduleModel(
        floor: '5o andar', hours: '12:00-13:00  16:00-17:00  20:00-21:00');
    _lstScheduleRegister.add(_sm);
    _sm = new scheduleModel(
        floor: '5o andar', hours: '12:00-13:00  16:00-17:00  20:00-21:00');
    _lstScheduleRegister.add(_sm);
//    getData();
  }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  /*
  this method adds elements to the schedule list of NutriCar
   */

  void loadFloorSchedule(DocumentSnapshot document) {
    String floor = document.data['number'].toString();
    String hours = '';
    List periods = List.from(document.data['periods']);

    periods.forEach((period) {
      //hours += period['start_time'].toString() + '-' + period['end_time'].toString()+ ' ';
      hours = hours + period['start_time'] + '-' + period['end_time'] + ' ';
    });
    scheduleModel _sm = new scheduleModel(floor: floor, hours: hours);
    _lstScheduleRegister.add(_sm);
  }

  void getData() {
    //_lstScheduleRegister.clear();
    final stream = Firestore.instance
        .collection('floors')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        loadFloorSchedule(f);

        //print('Andar:  ' + f.data["number"].toString());
        //print('${f.data}');
      });
    });
  }

  void _addItemsToList() {
    //_lstScheduleRegister = new List<scheduleModel>();
    setState(() {
      /* List<String> aux = ['12:00-13:00','16:00-17:00', '20:00-21:00' ];
      scheduleModel _sm = new scheduleModel(floor: '5o andar',hours: '12:00-13:00  16:00-17:00  20:00-21:00');
      _lstScheduleRegister.add(_sm);*/

      getData();
    });
    ;
  }

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
        child: new ListView.builder(
            itemCount: _lstScheduleRegister.length,
            itemBuilder: (BuildContext ctxt, int Index) {
              return createTimeTableWidget(_lstScheduleRegister, Index);
            }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
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
}
