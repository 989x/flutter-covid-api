import 'package:flutter/material.dart';
import 'screen/tracker.dart';

import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: Tracker(),
      debugShowCheckedModeBanner: false,
    );
  }        
}
