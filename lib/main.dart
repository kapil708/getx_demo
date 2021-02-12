import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/app_init.dart';
import 'package:getx_demo/controllers/splash_controller.dart';
import 'package:getx_demo/packages/config_package.dart';
import 'package:getx_demo/theme/theme_service.dart';
import 'package:getx_demo/utility/language_list.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  await GetStorage.init();
  Get.put(SplashController());
  Get.put(SplashController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      allowFontScaling: false,
      child: GetMaterialApp(
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget,
          );
        },
        debugShowCheckedModeBanner: false,
        translations: Language(),
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'), // tran
        title: "My App",
        home: AppInit(),
        getPages: AppRouter.getPages,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeService().getThemeMode(),
      ),
    );
  }
}
