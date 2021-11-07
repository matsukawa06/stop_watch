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
        backgroundColor: Colors.black,
        title: Text('シンプルストップウォッチ'),
        // ステータスバーをダーク用の表示に変更
        brightness: Brightness.dark,
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
                  fontSize: 70,
                  color: Colors.white,
                ),
              ),
            ),
            SpaceBox.height(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: FloatingActionButton(
                    backgroundColor: stopWatchModel.isStartPressed ? Colors.green : Colors.red,
                    onPressed: stopWatchModel.isStartPressed
                        ? stopWatchModel.startStopWatch
                        : stopWatchModel.stopStopWatch,
                    child: Text(
                      stopWatchModel.isStartPressed ? "開始" : "停止",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
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
