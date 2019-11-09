import 'package:flutter/material.dart';
import '../models/carte.dart';

class CarteCard extends StatelessWidget {
  const CarteCard(
      {Key key, this.choice, this.onTap, @required this.item, this.selected: false}
    ) : super(key: key);
 
  final Carte choice;
  final VoidCallback onTap;
  final Carte item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
        return Card(
          color: Colors.white,
          child: Row(
              children: <Widget>[
                new Container( 
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.topLeft,
                  height: 100,
                  width: 100,
                  child: Image.network(
                    choice.image
                  )),
                new Expanded( 
                  child: new Container( 
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.topLeft,
                  child:                    
                    Text(choice.title, style: null, textAlign: TextAlign.left, maxLines: 5,),
                  )
                ),
            ],
           crossAxisAlignment: CrossAxisAlignment.start,
          )
    );
  }
}