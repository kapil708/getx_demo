import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/getbuilder_controller.dart';
import 'package:getx_demo/packages/config_package.dart';

class GetBuilderScreen extends StatelessWidget {
  var getBuilderController = Get.find<GetBuilderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetBuilder"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenWidth(20)),
          child: Column(
            children: [
              GetBuilder<GetBuilderController>(
                builder: (controller) {
                  return Text("${getBuilderController.counterValue}", style: h1);
                },
              ),
              Text("Counter", style: bodyStyle1),
              RaisedButton(
                child: Text("Update Counter"),
                onPressed: () => getBuilderController.increment(),
              ),
              /*Row(
                children: [˚
                  RaisedButton(
                    child: Text("Add More"),
                    onPressed: () => page1Controller.addMore(),
                  ),
                ],
              ),*/
              /*Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: page1Controller.list.length,
                    itemBuilder: (context, index) {
                      return Text("${page1Controller.list[index]['name']}");
                    },
                  );
                }),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
