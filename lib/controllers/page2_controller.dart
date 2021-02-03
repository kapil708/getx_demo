//import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/local_data.dart';

class Page2Controller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    var data = Get.arguments;
    print("Get.arguments");
    print(data);
    super.onInit();
  }
}
