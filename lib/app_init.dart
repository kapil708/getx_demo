import 'package:flutter/material.dart';
import 'package:getx_demo/app_router.dart';
import 'package:getx_demo/views/splash_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:get/get.dart';

class AppInit extends StatefulWidget {
  @override
  _AppInitState createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.init("10a70431-5cef-49d4-99fe-18adf431036a", iOSSettings: {OSiOSSettings.autoPrompt: false, OSiOSSettings.inAppLaunchUrl: false});
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
      // will be called whenever a notification is received
      print("Received notification");
      //print(notification.jsonRepresentation().replaceAll("\\n", "\n"));
      print(notification.payload.additionalData);
    });

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // will be called whenever a notification is opened/button pressed.
      print("Opened notification");
      print(result.notification.jsonRepresentation().replaceAll("\\n", "\n"));
      print(result.notification.payload.additionalData);
      dynamic data = result.notification.payload.additionalData;
      if (data != null) {
        if (data["type"] == "notification") {
          Get.toNamed(AppRouter.language);
        }
      }
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      // will be called whenever the permission changes
      // (ie. user taps Allow on the permission prompt in iOS)
      print("PERMISSION STATE CHANGED");
    });

    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // will be called whenever the subscription changes
      //(ie. user gets registered with OneSignal and gets a user ID)
    });

    OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
      // will be called whenever then user's email subscription changes
      // (ie. OneSignal.setEmail(email) is called and the user gets registered
    });

    // For each of the above functions, you can also pass in a
    // reference to a function as well:

    void _handleNotificationReceived(OSNotification notification) {}

    void main() {
      OneSignal.shared.setNotificationReceivedHandler(_handleNotificationReceived);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
