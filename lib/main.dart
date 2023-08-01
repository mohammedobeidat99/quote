import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quote/screen/home_screen.dart';
import 'package:quote/screen/home_screen2.dart';
import 'package:quote/screen/splash_screen.dart';

import 'constant/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color2.main2, // Change this to your desired color
    ));
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Quote',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
        scaffoldBackgroundColor: 
         Color(0xFFD6CDA4), // Change this to your desired color

        primarySwatch: Colors.blue,
      ),
     home: SplashScreen(),
      routes: {
        '/home': (context) => Home(),
      },
    );
  }
}
