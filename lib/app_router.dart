import 'package:flutter/material.dart';
import 'package:getx_demo/controllers/bindings/splash_binding.dart';
import 'package:getx_demo/views/page2.dart';
import 'package:getx_demo/views/page3.dart';
import 'package:get/get.dart';

import 'views/page1.dart';

class AppRouter {
  static const home = '/';
  static const page2 = '/page2';
  static const page3 = '/page3';

  static List<GetPage> getPages = [
    GetPage(name: home, page: () => Page1(), binding: SplashBind()),
    GetPage(name: page2, page: () => Page2()),
    GetPage(name: page3, page: () => Page3()),
  ];
}
