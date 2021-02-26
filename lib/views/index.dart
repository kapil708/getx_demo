import 'dart:convert';
import 'dart:typed_data';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getx_demo/packages/config_package.dart';
import 'package:getx_demo/theme/theme_service.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;

import 'package:printing/printing.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with TickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;
  GlobalKey _globalKey = new GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying ? _animationController.forward() : _animationController.reverse();
    });
  }

  void _showQRandPrint() {
    _getWidgetImage().then((img) {
      final pdf = new PDFDocument();
      final page = new PDFPage(pdf, pageFormat: PDFPageFormat(75.0, 100.0));
      final g = page.getGraphics();
      final font = new PDFFont(pdf);

      PDFImage image = new PDFImage(pdf, image: img, width: 75, height: 100);
      g.drawImage(image, 0.0, 0.0);

      Printing.printPdf(document: pdf);
    });
  }

  Future<Uint8List> _getWidgetImage() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      debugPrint(bs64.length.toString());
      return pngBytes;
    } catch (exception) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, (MediaQuery.of(context).size.width * 0.22222222222222224).toDouble()),
              painter: RPSCustomPainter(),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth(20)),
              child: RepaintBoundary(
                key: _globalKey,
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
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Styling", style: ThemeService().isDark ? h2.copyWith(color: Colors.red) : h2.copyWith(color: Colors.yellow)),
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
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRouter.language);
                          },
                          child: Card(
                            elevation: 5,
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
                        InkWell(
                          onTap: () {
                            //
                          },
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Widget To PDF", style: h2),
                                  SizedBox(height: screenWidth(5)),
                                  Text("Widget to pdf convert", style: bodyStyle3),
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
          ),
        ],
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2000000);
    path_0.lineTo(size.width * 0.01513889, size.height * 0.2665625);
    path_0.cubicTo(size.width * 0.03027778, size.height * 0.3343750, size.width * 0.06041667, size.height * 0.4656250, size.width * 0.09097222, size.height * 0.4834375);
    path_0.cubicTo(size.width * 0.1211806, size.height * 0.5000000, size.width * 0.1513889, size.height * 0.4000000, size.width * 0.1819444, size.height * 0.4165625);
    path_0.cubicTo(size.width * 0.2121528, size.height * 0.4343750, size.width * 0.2423611, size.height * 0.5656250, size.width * 0.2729167, size.height * 0.5334375);
    path_0.cubicTo(size.width * 0.3030556, size.height * 0.5000000, size.width * 0.3333333, size.height * 0.3000000, size.width * 0.3638889, size.height * 0.2000000);
    path_0.cubicTo(size.width * 0.3939583, size.height * 0.1000000, size.width * 0.4243056, size.height * 0.1000000, size.width * 0.4548611, size.height * 0.1834375);
    path_0.cubicTo(size.width * 0.4848611, size.height * 0.2656250, size.width * 0.5152778, size.height * 0.4343750, size.width * 0.5451389, size.height * 0.5165625);
    path_0.cubicTo(size.width * 0.5757639, size.height * 0.6000000, size.width * 0.6062500, size.height * 0.6000000, size.width * 0.6361111, size.height * 0.5165625);
    path_0.cubicTo(size.width * 0.6666667, size.height * 0.4343750, size.width * 0.6972222, size.height * 0.2656250, size.width * 0.7270833, size.height * 0.2500000);
    path_0.cubicTo(size.width * 0.7575694, size.height * 0.2343750, size.width * 0.7881944, size.height * 0.3656250, size.width * 0.8180556, size.height * 0.4500000);
    path_0.cubicTo(size.width * 0.8484722, size.height * 0.5343750, size.width * 0.8784722, size.height * 0.5656250, size.width * 0.9090278, size.height * 0.5834375);
    path_0.cubicTo(size.width * 0.9393750, size.height * 0.6000000, size.width * 0.9694444, size.height * 0.6000000, size.width * 0.9847222, size.height * 0.6000000);
    path_0.lineTo(size.width, size.height * 0.6000000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.9848611, size.height);
    path_0.cubicTo(size.width * 0.9697222, size.height, size.width * 0.9395833, size.height, size.width * 0.9090278, size.height);
    path_0.cubicTo(size.width * 0.8788194, size.height, size.width * 0.8486111, size.height, size.width * 0.8180556, size.height);
    path_0.cubicTo(size.width * 0.7878472, size.height, size.width * 0.7576389, size.height, size.width * 0.7270833, size.height);
    path_0.cubicTo(size.width * 0.6969444, size.height, size.width * 0.6666667, size.height, size.width * 0.6361111, size.height);
    path_0.cubicTo(size.width * 0.6060417, size.height, size.width * 0.5756944, size.height, size.width * 0.5451389, size.height);
    path_0.cubicTo(size.width * 0.5151389, size.height, size.width * 0.4847222, size.height, size.width * 0.4548611, size.height);
    path_0.cubicTo(size.width * 0.4242361, size.height, size.width * 0.3937500, size.height, size.width * 0.3638889, size.height);
    path_0.cubicTo(size.width * 0.3333333, size.height, size.width * 0.3027778, size.height, size.width * 0.2729167, size.height);
    path_0.cubicTo(size.width * 0.2424306, size.height, size.width * 0.2118056, size.height, size.width * 0.1819444, size.height);
    path_0.cubicTo(size.width * 0.1515278, size.height, size.width * 0.1215278, size.height, size.width * 0.09097222, size.height);
    path_0.cubicTo(size.width * 0.06062500, size.height, size.width * 0.03055556, size.height, size.width * 0.01527778, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff0099ff).withOpacity(1);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
