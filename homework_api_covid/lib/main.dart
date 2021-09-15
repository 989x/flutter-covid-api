import 'package:flutter/material.dart';
import 'screen/tracker.dart';

// import '/screen/screen_1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: Tracker(),
      debugShowCheckedModeBanner: false,
    );
  }        
}
