import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final bool isRunning;


  CountdownTimer({Key? key, required this.isRunning}) : super(key: key);

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  int countdownValue = 30;
   Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  void stopTimer () {

    _timer?.cancel();

  }


  void startTimer () {
    if (_timer != null ) {
      _timer?.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownValue > 0) {
        setState(() {
          countdownValue--;
        });
      } else {
        _timer?.cancel();
      }
    });


  }

  void resetTimer() {
    setState(() {
      countdownValue = 30;
    });

  }




  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$countdownValue",
        style: TextStyle(fontSize: 100, color: Colors.white),
      ),
    );
  }
}