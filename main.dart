import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:yarrow/List.dart';
import 'package:yarrow/Analysis.dart';

import 'Hexagram.dart';

void main() => runApp(MyApp());

var hexListNum = [0, 0, 0, 0, 0, 0];
var hexList = [0,0,0,0,0,0];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yarrow',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(icon: Icon(
                Icons.whatshot,
                color: Colors.black,
              )),
              Tab(icon: Icon(
                Icons.apps,
                color: Colors.black,
              )),
            ],
          ),
          title: const Text(
            'ＹＡＲＲＯＷ',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Yarrow(),
            List(), // Icon(Icons.directions_bike),
          ],
        ),
      ),
    ),
    );
  }
}
class Yarrow extends StatefulWidget {
  @override
  State createState() => _Yarrow();
}

class _Yarrow extends State<Yarrow>{
//variables and methods
  final int BEGINNING = 49;
  int randomNum = 0;

  int collection = 0;
  int totalReminder = 0;


  bool isButtonValid = true;

  int seconds = 0;
  late Timer countDownTimer;
  // int? seconds;
  // Timer? countDownTimer;

  @override
  void initState() {
    countDownTimer = Timer.periodic(Duration(seconds: 1), (timer){
        cancelTimer();
    });
    super.initState();
  }

  int getChange(int value){
    int remainder = 0;
    int left = 0;
    int right = 0;

    Random r = new Random();
    left = r.nextInt(value);
    right = value - left;

    right --;
    remainder ++;

    if (left % 4 != 0){
      remainder += left % 4;
    }else{
      remainder += 4;
    }

    if (right % 4 != 0){
      remainder += right % 4;
    }else{
      remainder += 4;
    }

    totalReminder += remainder;
    return (value - remainder);
  }

  int getHexagram(double num){
    print('------------');
     print(num);
    if (num == 6){
      return 6;
    }else if(num == 7){
      return 7;
    }else if(num == 8){
      return 8;
    }else{
      return 9;
    }
  }

  void hexagramToNum(){
    for(int i=0; i<6; i++){
      if(hexList[i] == 6 || hexList[i] == 8){
        hexListNum[i] = 0;
      }else{
        hexListNum[i] = 1;
      }
    }
  }

  void processing() {

    var newHexList = [0,0,0,0,0,0];
    for(int i=0; i < 6; i++){

      totalReminder = 0;
      int num = BEGINNING;

      for(int i = 0; i < 3; i++){

        int newNum = getChange(num);
        num = newNum;

      }

      newHexList[i] = getHexagram((49-totalReminder)/4);

    }

    hexagramToNum();

    setState(() {
      hexList = newHexList;
      print(hexList.toString());
    });

    isButtonValid = !isButtonValid;
    // startTimer();
    var now = DateTime.now();
    var twoHours = now.add(Duration(seconds: 5)).difference(now);
    seconds = twoHours.inSeconds;
    countDownTimer = new Timer.periodic(new Duration(seconds: 1), (timer){
      setState(() {
        seconds--;
      });
      if (seconds == 0) {
        //倒计时秒数为0，取消定时器
        cancelTimer();
        setState(() {
          isButtonValid = !isButtonValid;
        });
      }
    });
  }

  //时间格式化，根据总秒数转换为对应的 hh:mm:ss 格式
  String constructTime(int seconds) {
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return formatTime(hour) + ":" + formatTime(minute) + ":" + formatTime(second);
  }

  //数字格式化，将 0~9 的时间转换为 00~09
  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  void cancelTimer() {
    if(countDownTimer != null){
      countDownTimer.cancel();
    }
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Hexagram(hexList),
          Container(
            margin: EdgeInsets.fromLTRB(0, 100, 0, 10),
            child: RawMaterialButton(
              onPressed:
                  isButtonValid ?
                  () => processing() : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Analysis()),
                    );
                  },
              elevation: 2.0,
              fillColor:
              isButtonValid ?
              Colors.black87 : Colors.white,
              child: Icon(
                isButtonValid ?
                Icons.arrow_upward : Icons.arrow_downward,
                color:
                isButtonValid ?
                Colors.white : Colors.black87,
                size: 100.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child:
            Text(
              isButtonValid?
              'Press it to get started' : constructTime(seconds),
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


