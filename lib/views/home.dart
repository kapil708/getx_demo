import 'package:flutter/material.dart';
import 'package:getx_demo/packages/config_package.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth(20)),
          child: Wrap(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRouter.stylingScreen);
                },
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Styling", style: h2),
                        SizedBox(height: screenWidth(5)),
                        Text("theme & style", style: bodyStyle3),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRouter.pagingScreen);
                },
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Getx Navigation", style: h2),
                        SizedBox(height: screenWidth(5)),
                        Text("navigation & data", style: bodyStyle3),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRouter.controllerScreen);
                },
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Getx Controllers", style: h2),
                        SizedBox(height: screenWidth(5)),
                        Text("all 3 controllers", style: bodyStyle3),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
