import 'package:flutter/material.dart';
import 'package:getx_demo/packages/config_package.dart';
import 'package:getx_demo/theme/theme_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying ? _animationController.forward() : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth(20)),
          child: Column(
            children: [
              Wrap(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRouter.stylingScreen);
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
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
                      color: Colors.white,
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
                      color: Colors.white,
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
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRouter.language);
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Language", style: h2),
                            SizedBox(height: screenWidth(5)),
                            Text("language selection", style: bodyStyle3),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRouter.bottomNavigationScreen);
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bottom Navigation", style: h2),
                            SizedBox(height: screenWidth(5)),
                            Text("Bottom Navigations & Animation", style: bodyStyle3),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ThemeService().changeThemeMode();
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Change Theme Dark", style: h2),
                            SizedBox(height: screenWidth(5)),
                            Text("change app theme dark & light", style: bodyStyle3),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _animationController,
                    ),
                    iconSize: 150,
                    splashColor: Colors.greenAccent,
                    onPressed: () => _handleOnPressed(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
