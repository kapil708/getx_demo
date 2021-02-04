import 'package:getx_demo/controllers/splash_controller.dart';
import 'package:getx_demo/packages/config_package.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  //this will call Splash Controller
  var splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/care_rocket_logo.png",
                    width: screenWidth(150),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Splash ',
                      style: h1.merge(ls5),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Screen',
                          style: h1.merge(ls5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: CircularProgressIndicator(),
              height: 20,
              width: 20,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
