import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarrow/HexDetail.dart';

class List extends StatelessWidget{

  final hexagramList = [
    {
      'Name': 'Ch\'ien',
      'Num': [1,1,1,1,1,1],
      'Script': [
        'Hidden dragon. Do not act.',
        'Dragon appearing in the field. It furthers one to see the great man.',
        'All day long the superior man is creatively active. At nightfall his mind is still beset with cares. Danger. No blame.',
        'Wavering flight over the depths. No blame.',
        'Flying dragon in the heavens. It furthers one to see the great man.',
        'Arrogant dragon will have cause to repent.',
        'There appears a flight of dragons without heads.',
      ],
    },
    {
      'Name': 'K\'un',
      'Num': [0,0,0,0,0,0],
      'Script': [
        'When there is hoarfrost underfoot, Solid ice is not far off.',
        'Straight, square, great. Without purpose, Yet nothing remains unfurthered.',
        'Hidden lines. One is able to remain persevering. If by chance you are in the service of a king, Seek not works, but bring to completion.',
        'A tied-up sack. No blame, no praise.',
        'A yellow lower garment brings supreme good fortune.',
        'Dragons fight in the meadow. Their blood is black and yellow.',
        'Lasting perseverance furthers.',
      ],
    },
  ];

  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: hexagramList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            hexagramList[index]['Name'] as String,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                  MaterialPageRoute(builder: (context) => HexDetail(hexagramList[index])),
              );
            }
          );
        },
    );
  }
}