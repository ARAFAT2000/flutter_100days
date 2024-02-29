import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{

  ///instance create for messaging and plugin

  FirebaseMessaging messaging =FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();

///first of all resquest notification permission function banate hbe
  ///setting sob true krte hbe
  ///baki sob check krte hbe
  void requestNotificationPermission()async {

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      sound: true,
      provisional: true
    );

    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      print('User Granted permission');
    }else if(settings.authorizationStatus==AuthorizationStatus.provisional){
      print('User provisionalpermission');
    }else{
      print('User no available ');
    }

  }

  void initLocalNotification(BuildContext contex,RemoteMessage message) async{
    var androidInitializationSettings =AndroidInitializationSettings('@mipmap/ic_launcher.png');
    var iosInitializationSettings =DarwinInitializationSettings();

    var innitializationSetting = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings
    );
    await _flutterLocalNotificationsPlugin.initialize(
        innitializationSetting,
        onDidReceiveNotificationResponse:(payload){

        } );
  }

  Future<void>showNotification(RemoteMessage message)async{

    AndroidNotificationChannel channel=AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        'High Performanse Notification',
      importance: Importance.max
    );
   AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
       channel.id.toString(),
       channel.name.toString(),
    channelDescription: 'Your channel Desription',
     importance: Importance.high,
     priority: Priority.high,
     ticker: 'Tiker'

   );
  DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true
  );
   NotificationDetails notificationDetails = NotificationDetails(
     android: androidNotificationDetails,
     iOS: darwinNotificationDetails
   );

   Future.delayed(Duration.zero,
    (){
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    }
   );



  }


  ///token create krte hbe same as api system
  ///
  Future<String> getToken()async{
    String ? token = await messaging.getToken();
    return token!;

  }
///firebaseinite create krchi,,,,only data check krar jnno
  void firebaseinite(){

       FirebaseMessaging.onMessage.listen((messege) {
      {
        if (kDebugMode) {
          print(messege.notification!.title.toString());
        }
        print(messege.notification!.body.toString());
      }
      showNotification(messege);
    });
  }


}