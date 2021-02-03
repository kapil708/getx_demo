import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app_router.dart';
import 'package:getx_demo/controllers/page1_controller.dart';

class Page1 extends StatelessWidget {
  var page1Controller = Get.put(Page1Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              RaisedButton(
                child: Text("Add More"),
                onPressed: () => page1Controller.addMore(),
              ),
              RaisedButton(
                child: Text("Page 2"),
                onPressed: () {
                  var data = {"Name": "Kapil"};
                  Get.toNamed(AppRouter.page2, arguments: data);
                },
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: page1Controller.list.length,
                itemBuilder: (context, index) {
                  return Text("${page1Controller.list[index]['name']}");
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
