import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Hexagram.dart';
import 'Script.dart';

class HexDetail extends StatelessWidget {

  final Map<String, Object> detail;

  HexDetail(this.detail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detail['Name'] as String),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Hexagram(detail['Num']),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                detail['Name'] as String,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 50, 50, 50),
              alignment: Alignment.topLeft,
              child:
              Text(
                detail['Script'][0] as String,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
