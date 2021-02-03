import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    await Future.delayed(Duration(seconds: 1));
    checkLogin();
    super.onInit();
  }

  void checkLogin() {}
}
