import 'package:flutter/material.dart';
import 'package:getx_demo/app_init.dart';
import 'package:getx_demo/packages/config_package.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: AppInit(),
      getPages: AppRouter.getPages,
      theme: appTheme,
    );
  }
}
