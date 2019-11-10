import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class FloorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('floors').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            int Index = 0;
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                String hours = '';
                Index ++;
                List periods =  List.from(document['periods']);
                periods.forEach((period)
                {
                  //hours += period['start_time'].toString() + '-' + period['end_time'].toString()+ ' ';
                  hours = hours + period['start_time'] + '-' + period['end_time'] + '   ';
                });
                return new Container(
                  width: 100,
                    height: 100,
                    color: (Index % 2 == 0) ? Colors.grey[300] : Colors.white,

                  child: new ListTile(

                    title: Row(

                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(25),
                          child: Center(child:Text(document['number'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),

                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Center(child: new Text(hours, style: TextStyle(fontSize: 15))),

                        ),
                      ]

                    ) //new Text(document['number'].toString()),
                  )
                );
              }).toList(),
            );
        }
      },
    );
  }
}