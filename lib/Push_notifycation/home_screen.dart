import 'package:flutter/material.dart';
import 'package:flutter_100days/Push_notifycation/notification_services.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NotificationServices notificationServices =NotificationServices();

@override
  void initState() {
    // TODO: implement initState
  notificationServices.requestNotificationPermission();
 notificationServices.firebaseinite();

  notificationServices.getToken().then((value) {
    print('Device token');
    print(value);
  });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Push Notification'),
      ),
    );
  }
}
