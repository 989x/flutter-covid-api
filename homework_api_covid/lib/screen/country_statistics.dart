import 'package:flutter/material.dart';

import 'package:homework_api_covid/main.dart';

import '../utils/constants.dart';

import '../models/country_summary.dart';

class CountryStatistics extends StatelessWidget {

  final CountrySummaryModel summary;

  CountryStatistics({required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        buildCard(
          "case",
          summary.todayCases,
          summary.recovered,
          kConfirmedColor
        ),

        buildCard(
          "ative",
          summary.todayCases,
          summary.recovered,
          kActiveColor
        ),

        buildCard(
          "recovered",
          summary.todayCases,
          summary.recovered,
          kRecoveredColor
        ),

        buildCard(
          "death",
          summary.todayCases,
          summary.recovered,
          kDeathColor
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            "update at " + summary.UpdateDate,
            style: TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        )

      ],
  
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color){
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[

            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "total",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      totalCount.toString(),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),

                  ],

                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "total",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      totalCount.toString(),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),

                  ],

                )
              ],
            )
          ],
        ),
      ),
    );
  }
  

}