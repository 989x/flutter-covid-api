import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'navigation_option.dart';

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
          "covid-19 thailand"
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
                )
              )
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