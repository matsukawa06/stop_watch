import 'dart:ui';

// import 'package:flutter/cupertino.dart';
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
    final stopWatchModel = Provider.of<StopWatchModel>(context);
    // var _switchValue = false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('目隠しストップウォッチ'),
        // ステータスバーをダーク用の表示に変更
        // brightness: Brightness.dark,
        // 右側ボタン
        actions: [
          IconButton(
            onPressed: () {
              // "puch"で
            },
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
          )
        ],
      ),
      // 再描画したい箇所だけConsumerで囲む
      body: Center(
        child: Column(
          children: [
            SpaceBox.height(20),
            //=============================
            // タイム表示／非表示トグル
            //=============================
            SwitchListTile(
              value: stopWatchModel.switchValue,
              title: Text(
                'タイムを隠す',
                style: TextStyle(
                  fontSize: 25,
                  // color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  // fontFamily: 'Cursive',
                ),
              ),
              onChanged: (bool value) {
                stopWatchModel.changeIsSwitchValue(value);
                // setState(() {
                //   _switchValue = value;
                // });
              },
            ),
            //=============================
            // 秒数表示
            //=============================
            SpaceBox.height(20),
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Consumer<StopWatchModel>(
                    builder: (context, model, _) => FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        model.stopWatchTimeDisplay,
                        style: TextStyle(fontSize: 70,
                            // color: Colors.white,
                            fontFeatures: [
                              FontFeature.tabularFigures(),
                            ]),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: stopWatchModel.switchValue,
                    child: Container(
                      alignment: Alignment.center,
                      // width: double.infinity,
                      color: Colors.white,
                      child: Text(
                        '非表示中',
                        style: TextStyle(
                          fontSize: 55,
                          color: Colors.red,
                          // backgroundColor: Colors.black,
                        ),
                      ),
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
