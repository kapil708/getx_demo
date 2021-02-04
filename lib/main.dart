import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:getx_demo/app_init.dart';
import 'package:getx_demo/controllers/splash_controller.dart';
import 'package:getx_demo/packages/config_package.dart';
import 'package:getx_demo/utility/language_list.dart';

void main() {
  Get.put(SplashController());
  Get.put(SplashController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: Language(),
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'), // tran
        title: "My App",
        home: AppInit(),
        getPages: AppRouter.getPages,
        theme: appTheme,
      ),
    );
  }
}
