import 'package:flutter/material.dart';

class Script extends StatelessWidget {
  // final Function selectHandler;
  final List scr;
  Script(this.scr);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        scr[0] as String,
      ),
    );
  }
}
