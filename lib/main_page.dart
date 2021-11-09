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
            //=============================
            // 秒数表示
            //=============================
            SpaceBox.height(50),

            Consumer<StopWatchModel>(
              builder: (context, model, _) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      model.timeDisplayMinutes,
                      style: _TextStyles.body,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      ":",
                      style: _TextStyles.body,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(
                      model.timeDisplaySeconds,
                      style: _TextStyles.body,
                    ),
                  ),
                  Text(
                    ".",
                    style: _TextStyles.body,
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(
                      model.timeDisplayMilliseconds,
                      style: _TextStyles.body,
                    ),
                  ),
                ],
              ),
            ),

            //=============================
            // 開始・終了ボタン
            //=============================
            SpaceBox.height(50),
            SizedBox(
              width: 150,
              height: 150,
              child: FloatingActionButton(
                backgroundColor:
                    stopWatchModel.isStartPressed ? Colors.green : Colors.red,
                onPressed: stopWatchModel.isStartPressed
                    ? stopWatchModel.startStopWatch
                    : stopWatchModel.stopStopWatch,
                child: Text(
                  stopWatchModel.isStartPressed ? "開始" : "停止",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            //=============================
            // リセットボタン
            //=============================
            SpaceBox.height(32),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  onPressed: stopWatchModel.isResetPressed
                      ? null
                      : stopWatchModel.resetStopWatch,
                  child: Text(
                    "リセット",
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _TextStyles {
  static const body = TextStyle(fontSize: 70, color: Colors.white);
}
