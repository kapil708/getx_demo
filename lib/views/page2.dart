import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/page2_controller.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var page2Controller = Get.put(Page2Controller());

  @override
  void initState() {
    // TODO: implement initState
    var data = Get.arguments;
    var data1 = Get.parameters;
    print("Get.arguments");
    print(data);
    print("Get.parameters");
    print(data1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Text("hi"),
    );
  }
}
