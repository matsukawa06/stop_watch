import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stop_watch/main_page.dart';

void main() => runApp(
    ScreenUtilInit(designSize: Size(360, 690), builder: () => MainPage()));
