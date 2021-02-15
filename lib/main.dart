import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/controllers/splash_controller.dart';
import 'package:getx_demo/packages/config_package.dart';
import 'package:getx_demo/theme/theme_service.dart';
import 'package:getx_demo/utility/language_list.dart';
import 'package:getx_demo/views/splash_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  await GetStorage.init();

  OneSignal.shared.init(
    "10a70431-5cef-49d4-99fe-18adf431036a",
    iOSSettings: {OSiOSSettings.autoPrompt: false, OSiOSSettings.inAppLaunchUrl: false},
  );
  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

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
        home: SplashScreen(),
        getPages: AppRouter.getPages,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeService().getThemeMode(),
      ),
    );
  }
}
//22757aeb-02ac-4ab0-807f-0758a450f68a
