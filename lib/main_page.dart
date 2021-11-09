import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            SpaceBox.height(50.h),

            Consumer<StopWatchModel>(
              builder: (context, model, _) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      model.timeDisplayMinutes,
                      style: TextStyle(fontSize: 70.sp, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      ":",
                      style: TextStyle(fontSize: 70.sp, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      model.timeDisplaySeconds,
                      style: TextStyle(fontSize: 70.sp, color: Colors.white),
                    ),
                  ),
                  Text(
                    ".",
                    style: TextStyle(fontSize: 70.sp, color: Colors.white),
                  ),
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      model.timeDisplayMilliseconds,
                      style: TextStyle(fontSize: 70.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            //=============================
            // 開始・終了ボタン
            //=============================
            SpaceBox.height(50.h),
            SizedBox(
              width: 150.w,
              height: 150.h,
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
                    fontSize: 40.sp,
                  ),
                ),
              ),
            ),
            //=============================
            // リセットボタン
            //=============================
            SpaceBox.height(32.h),
            SizedBox(
              height: 50.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  onPressed: stopWatchModel.isResetPressed
                      ? null
                      : stopWatchModel.resetStopWatch,
                  child: Text(
                    "リセット",
                    style: TextStyle(fontSize: 20.sp),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

// class _TextStyles {
//   static const body = TextStyle(
//     //fontSize: 70.sp,
//     color: Colors.white,
//   );
// }
