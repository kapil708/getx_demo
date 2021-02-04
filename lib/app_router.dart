import 'package:getx_demo/controllers/bindings/splash_binding.dart';
import 'package:get/get.dart';
import 'package:getx_demo/packages/screen_package.dart'; //all views list

class AppRouter {
  static const home = '/home';
  static const stylingScreen = '/stylingScreen';
  static const pagingScreen = '/pagingScreen';
  static const controllerScreen = '/controllerScreen';
  static const page1 = '/page1';
  static const getBuilderScreen = '/getBuilderScreen';
  static const obxGtxScreen = '/obxGtxScreen';

  static List<GetPage> getPages = [
    GetPage(name: home, page: () => Home()),
    GetPage(name: stylingScreen, page: () => StylingScreen()),
    GetPage(name: pagingScreen, page: () => PagingScreen()),
    GetPage(name: controllerScreen, page: () => ControllerScreen()),
    GetPage(name: page1, page: () => Page1()),
    GetPage(name: getBuilderScreen, page: () => GetBuilderScreen()),
    GetPage(name: obxGtxScreen, page: () => ObxGtxScreen()),
  ];
}
