import 'package:flutter/material.dart';

import '../services/covid_service.dart';

import '../models/country_summary.dart';

import 'country_statistics.dart';

import 'country_loading.dart';

CovidService covidService = CovidService();

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {

  // //api
  late Future<CountrySummaryModel> summary;

  @override
  void initState(){
    super.initState();
    setState(() {
      summary = covidService.getCountrySummary();
    });
    // print(summary.data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              
              Text(
                "Corona virrus in thailand",
                style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),

              InkWell(
                onTap: () {
                  setState(() {
                    summary = covidService.getCountrySummary();
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),

        FutureBuilder(
          future: summary,
          builder: (context, snapshot) {
            if(snapshot.hasData)
              return CountryStatistics(summary: snapshot.data as CountrySummaryModel);
            else if (snapshot.hasError) {
              return Text("error");
            }

              print(snapshot);
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return countryLoadgin();
              default:
                return !snapshot.hasData
                ? Center(child: Text("Empty"),)
                : Center(child: Text("Data is here!"),);

                // : Center(child: Text(snapshot.data!.country!),);

                // : CountryStatistics(
                //   summary: snapshot.data,
                // );
            }
          }
        ),

      ],
    );
  }
}