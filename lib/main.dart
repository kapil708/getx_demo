import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:getx_demo/app_init.dart';
import 'package:getx_demo/packages/config_package.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My App",
        home: AppInit(),
        getPages: AppRouter.getPages,
        theme: appTheme,
      ),
    );
  }
}
