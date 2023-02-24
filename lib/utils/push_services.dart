import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop/utils/commons.dart';

import '../widgets/snackbar.dart';


class PushNotificationService {
  final FirebaseMessaging _fcm;

  PushNotificationService(this._fcm, this.navigatorKey);
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_channel', // id
    'My Channel', // title
    description: 'Important notifications from my server.', // description
    importance: Importance.high,
    playSound: false,
  );
  final storage = const FlutterSecureStorage();
  bool _isDialogShowing = false;
  late BuildContext dialogContext;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  // FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  final GlobalKey<NavigatorState> navigatorKey;
  Future initialise() async {
    FirebaseMessaging.instance.requestPermission(
      sound: true,
      alert: true,
      badge: true,
    );

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) async {
      if (message != null) {}
    });

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {});
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // debugPrint(message.data['moredata'].toString());
      print(message.data);
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        if (Platform.isAndroid) {
          CustomSnackBar.showCustomInfoSnack(
              navigatorKey.currentState!.context, message.data['msg']);
        }
      } else {}
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      debugPrint(message.data.toString());

      RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;
      if (notification != null) {}
    });
  }
}
