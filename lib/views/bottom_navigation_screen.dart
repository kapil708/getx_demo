import 'package:flutter/material.dart';
import 'package:getx_demo/packages/config_package.dart';
import 'package:getx_demo/theme/theme_service.dart';
import 'package:lottie/lottie.dart';

class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({Key key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

/// This is the private State class that goes with BottomNavigationScreen.
class _BottomNavigationScreenState extends State<BottomNavigationScreen> with TickerProviderStateMixin {
  AnimationController _homeAnimationController;
  AnimationController _jobAnimationController;
  AnimationController _offerAnimationController;
  AnimationController _profileAnimationController;

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    // TODO: implement initState
    _homeAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _jobAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _offerAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _profileAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  static List<Widget> _widgetOptions = <Widget>[
    Lottie.network('https://assets2.lottiefiles.com/packages/lf20_YK5Olq.json', height: 200, width: 200),
    Text(
      'Index 1: Job',
      style: optionStyle,
    ),
    Text(
      'Index 2: Offer',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      _homeAnimationController.reverse();
      _jobAnimationController.reverse();
      _offerAnimationController.reverse();
      _profileAnimationController.reverse();

      if (index == 0)
        _homeAnimationController.forward();
      else if (index == 1)
        _jobAnimationController.forward();
      else if (index == 2)
        _offerAnimationController.forward();
      else if (index == 3) _profileAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontSize: 0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_BWLq4L.json',
              controller: _homeAnimationController,
              height: 60,
              width: 60,
            ),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Lottie.network(
              'https://assets6.lottiefiles.com/packages/lf20_nIuZ4T.json',
              controller: _jobAnimationController,
              height: 60,
              width: 60,
            ),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: AnimatedIcon(
              icon: AnimatedIcons.list_view,
              progress: _offerAnimationController,
              color: Colors.black,
            ),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _profileAnimationController,
              color: Colors.black,
            ),
            label: '.',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
