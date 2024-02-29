import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_100days/Search_System/search_home_page.dart';
import 'Day-003/Downloader/mediadownload.dart';
import 'Day_001/Responsive_UI/container.dart';
import 'Day_001/Responsive_UI/flexi_able.dart';
import 'Day_001/Responsive_UI/media_query.dart';
import 'Day_001/Responsive_UI/responsive_builder.dart';
import 'Day_002/Important_element/expansion.dart';
import 'Day_002/Important_element/wrap.dart';

import 'Push_notifycation/home_screen.dart';


import 'Search_System/Api_search/Search/fake_search.dart';
import 'Search_System/Api_search/Search/fake_search_notmodel.dart';
import 'Search_System/Api_search/Search/search_home_page.dart';
import 'Search_System/search_home_page.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home:SearchHomePage(),
    );
  }
}


