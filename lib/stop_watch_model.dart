import 'package:flutter/material.dart';
import 'dart:async';

class StopWatchModel extends ChangeNotifier{

  bool isStopPressed = true;
  bool isResetPressed = true;
  bool isStartPressed = true;

  String stopWatchTimeDisplay = '00:00.00';
  var swatch = Stopwatch();
  final dul = const Duration(milliseconds: 100);

  startTimer(){
    // Timer(dul,keepRunning);
    Timer.periodic(dul, keepRunning);
  }

  keepRunning(Timer timer){
    if(swatch.isRunning){
      startTimer();
    }
    // this.stopWatchTimeDisplay = swatch.elapsed.inHours.toString().padLeft(2,"0") +':'
    //     + (swatch.elapsed.inMinutes%60).toString().padLeft(2,"0") +':'
    //     + (swatch.elapsed.inSeconds%60).toString().padLeft(2,"0") ;
    this.stopWatchTimeDisplay = (swatch.elapsed.inMinutes%60).toString().padLeft(2, "0") +":"
        + (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0") + "."
        + (swatch.elapsed.inMilliseconds % 100).toString().padLeft(2,"0");
    notifyListeners();
  }

  startStopWatch() {
    this.isStopPressed = false;
    this.isStartPressed = true;
    swatch.start();
    startTimer();
    notifyListeners();
  }


  stopStopWatch() {
    this.isStopPressed = true;
    this.isResetPressed = false;
    swatch.stop();
    notifyListeners();
  }

  resetStopWatch() {
    this.isResetPressed = true;
    this.isStartPressed = true;
    swatch.reset();
    stopWatchTimeDisplay = '00:00.00';
    notifyListeners();
  }

}