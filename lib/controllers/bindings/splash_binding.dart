import 'package:get/get.dart';
import 'package:getx_demo/controllers/account_controller.dart';
import 'package:getx_demo/controllers/splash_controller.dart';

class SplashBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
