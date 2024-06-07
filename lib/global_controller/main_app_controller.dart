import 'dart:io';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/translation/translation.dart';


class MainAppController extends GetxController {










  changeAppLang(){
    Get.locale == const Locale('ar','SA') ? Get.updateLocale(const Locale('en','US')) : Get.updateLocale(const Locale('ar','SA'));
  }


  @override
  void onInit() {
    // TODO: implement onInit
    isRefreshToken();
    getDeviceToken().then((value) {
      print(value);
    });
    requestPermission();
    foregroundNotification();
    firebaseInit(Get.context);
    update();
  }

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<String> getDeviceToken() async {
    String? token = await firebaseMessaging.getToken();
    return token.toString();
  }

  void isRefreshToken() async {
    firebaseMessaging.onTokenRefresh.listen((event) {
      print('Token Refreshed: $event');
    });
  }





  void requestPermission() async {
    if (Platform.isIOS) {
      await firebaseMessaging.requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: true,
          criticalAlert: true,
          provisional: true,
          sound: true);
    }
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future foregroundNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void firebaseInit(context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      print('Notification Title: ${notification!.title}');
      print('Notification Body: ${notification.body}');
      print('Data: ${message.data.toString()}');
      if (Platform.isAndroid) {
        intializeNotification(Get.context, message);
        showNotification(message);
      }

      if (Platform.isIOS) {
        foregroundNotification();
      }
    });
  }

  void intializeNotification(
       context, RemoteMessage message) async {
    var androidInitSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher_2');
    var iosInitSettings = const DarwinInitializationSettings();
    var initSettings = InitializationSettings(
        android: androidInitSettings, iOS: iosInitSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: (payload) {
      handleMessage(context, message);
    });
    update();
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    print('In Handle Message Function');
    if (message.data['type'] == 'text') {}
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      message.notification!.android!.channelId.toString(),
      message.notification!.android!.channelId.toString(),
      importance: Importance.max,
      showBadge: true,
      playSound: true,

    );
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      androidNotificationChannel.id.toString(),
      androidNotificationChannel.name.toString(),
      channelDescription: 'Flutter Notification',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      ticker: 'ticker',
      sound: androidNotificationChannel.sound,

    );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }



}
