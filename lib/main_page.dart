import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch/CommonUtil.dart';
import 'package:stop_watch/stop_watch_model.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'provider demo', home: _ProviderWidget());
  }
}

class _ProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StopWatchModel>(
          create: (context) => StopWatchModel(),
        )
      ],
      child: _MainPageBody(),
    );
  }
}

class _MainPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final stopWatchModel = Provider.of<StopWatchModel>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('シンプルストップウォッチ'),
      ),
      // 再描画したい箇所だけConsumerで囲む
      body: Center(
        child: Column(
          children: [
            SpaceBox.height(32),
            Consumer<StopWatchModel>(
              builder: (context, model, _) => Text(
                model.stopWatchTimeDisplay,
                //style: Theme.of(context).textTheme.headline2,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
            SpaceBox.height(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: stopWatchModel.isStartPressed
                      ? stopWatchModel.startStopWatch
                      : null,
                  child: Text(
                    "開始",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  // style: ElevatedButton.styleFrom(
                  //   shape: const CircleBorder(
                  //     side: BorderSide(
                  //       color: Colors.green,
                  //       width: 5,
                  //       style: BorderStyle.solid,
                  //     ),
                  //   ),
                  // ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: stopWatchModel.isStopPressed
                        ? stopWatchModel.stopStopWatch //null
                        : stopWatchModel.stopStopWatch,
                    child: Text("ストップ")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: stopWatchModel.isResetPressed
                        ? stopWatchModel.resetStopWatch //null
                        : stopWatchModel.resetStopWatch,
                    child: Text("リセット"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
