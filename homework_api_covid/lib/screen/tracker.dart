import 'package:flutter/material.dart';
import 'package:homework_api_covid/screen/country.dart';
import '../utils/constants.dart';
import 'navigation_option.dart';

import 'country.dart';

enum NavigationStatus {
  COUNTRY,
}

class Tracker extends StatefulWidget {
  const Tracker({ Key? key }) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.COUNTRY;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          "static covid"
        ),
        centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),

              //import country.dart
              child: AnimatedSwitcher(
                duration:Duration(microseconds: 250),
                child: navigationStatus == NavigationStatus.COUNTRY ? Country(): Country(),
              ),
            ),
          ),

          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                NavigationOption(
                  title: "thailand", 
                  selected: navigationStatus == NavigationStatus.COUNTRY, 
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.COUNTRY;
                    });
                  }
                )

              ],
            ),
          )
        ],
      ),
      
    );
  }
}