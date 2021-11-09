import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hexagram extends StatelessWidget{
  var hexList;
  Hexagram(this.hexList);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 150, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            hexList[0] % 2 != 0 ?
            Icons.whatshot : Icons.ac_unit,
            color:
            hexList[0] == 6 || hexList[0] == 9 ?
            Colors.black : Colors.black26,
            size: 50,
          ),
          Icon(
            hexList[1] % 2 != 0 ?
            Icons.whatshot : Icons.ac_unit,
            color:
            hexList[1] == 6 || hexList[1] == 9 ?
            Colors.black : Colors.black26,
            size: 50,
          ),
          Icon(
            hexList[2] % 2 != 0 ?
            Icons.whatshot : Icons.ac_unit,
            color:
            hexList[2] == 6 || hexList[2] == 9 ?
            Colors.black : Colors.black26,
            size: 50,
          ),
          Icon(
            hexList[3] % 2 != 0 ?
            Icons.whatshot : Icons.ac_unit,
            color:
            hexList[3] == 6 || hexList[3] == 9 ?
            Colors.black : Colors.black26,
            size: 50,
          ),
          Icon(
            hexList[4] % 2 != 0 ?
            Icons.whatshot : Icons.ac_unit,
            color:
            hexList[4] == 6 || hexList[4] == 9 ?
            Colors.black : Colors.black26,
            size: 50,
          ),
          Icon(
            hexList[5] % 2 != 0 ?
            Icons.whatshot : Icons.ac_unit,
            color:
            hexList[5] == 6 || hexList[5] == 9 ?
            Colors.black : Colors.black26,
            size: 50,
          ),
        ],
      ),
    );
  }
}