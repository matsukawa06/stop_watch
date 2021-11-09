import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchModel extends ChangeNotifier {
  bool isStopPressed = true;
  bool isResetPressed = true;
  bool isStartPressed = true;

  //String stopWatchTimeDisplay = '00:00.00';
  String timeDisplayMinutes = '00';
  String timeDisplaySeconds = '00';
  String timeDisplayMilliseconds = '00';

  // Stopwatch型を指定
  var swatch = Stopwatch();
  final dul = const Duration(milliseconds: 10);

  startTimer() {
    Timer(dul, keepRunning);
  }

  keepRunning() {
    if (swatch.isRunning) {
      startTimer();
    }
    int milliSeconds = ((swatch.elapsedMilliseconds / 10).floor() % 100);
    // this.stopWatchTimeDisplay =
    //     (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
    //         ':' +
    //         (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0") +
    //         '.' +
    //         (milliSeconds).toString().padLeft(2, "0");
    this.timeDisplayMinutes =
        (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0");
    this.timeDisplaySeconds =
        (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    this.timeDisplayMilliseconds = (milliSeconds).toString().padLeft(2, "0");
    notifyListeners();
  }

  startStopWatch() {
    this.isStopPressed = false;
    this.isStartPressed = false;
    this.isResetPressed = false;

    swatch.start();
    startTimer();
    notifyListeners();
  }

  stopStopWatch() {
    this.isStopPressed = true;
    this.isResetPressed = false;
    this.isStartPressed = true;

    swatch.stop();
    notifyListeners();
  }

  resetStopWatch() {
    this.isResetPressed = true;
    this.isStartPressed = true;
    this.isStopPressed = true;

    swatch.stop();
    swatch.reset();
    // stopWatchTimeDisplay = '00:00.00';
    timeDisplayMinutes = '00';
    timeDisplaySeconds = '00';
    timeDisplayMilliseconds = '00';
    notifyListeners();
  }
}
