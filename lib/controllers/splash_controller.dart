import 'package:get/get.dart';
import 'package:getx_demo/packages/config_package.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    await Future.delayed(Duration(seconds: 2));
    checkLogin();
    super.onInit();
  }

  void checkLogin() {
    Get.offAllNamed(AppRouter.home);
    //Get.toNamed(AppRouter.home);
  }
}
