//import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/local_data.dart';

class Page1Controller extends GetxController {
  var list = List().obs;
  var data = Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  void getData() async {
    await Future.delayed(Duration(seconds: 1));
    list.value = listData;
  }

  void addMore() {
    list.add({'id': '11', 'name': 'Nameeeeee'});
  }
}