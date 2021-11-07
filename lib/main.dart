import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stop_watch_model.dart';

void main() {
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(
  //         create: (_) => StopWatchModel(),
  //       )
  //     ],
  //     child: MyApp(),
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StopWatch',
        home: ChangeNotifierProvider<StopWatchModel>(
          create: (_) => StopWatchModel(),
          child: Scaffold(
            appBar: AppBar(
              title: Text('StopWatch練習'),
            ),
            body: Consumer<StopWatchModel>(
              builder: (context, model, child) {
                return Column(
                  children: [
                    const SizedBox(height: 100.0),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        model.stopWatchTimeDisplay,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent, //ボタンの背景色
                            ),
                            child: const Text('Stop'),
                            onPressed: model.isStopPressed
                                ? null
                                : model.stopStopWatch,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: const Text('RESET'),
                            onPressed: model.isResetPressed
                                ? null
                                : model.resetStopWatch,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                        onPressed:
                            model.isStartPressed ? model.startStopWatch : null,
                        child: const Text('START'))
                  ],
                );
              },
            ),
          ),
        ));
  }
}
