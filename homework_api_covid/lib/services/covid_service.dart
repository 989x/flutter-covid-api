import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/country_summary.dart';

class CovidService{

  // Future<CountrySummaryModel> getCountrySummary() async{
  //   final data = await http.Client().get("https://api.covid19api.com/summary");
    
  //   if(data.statusCode != 200)
  //     throw Exception();
      
  //   CountrySummaryModel summary = new CountrySummaryModel.fromJson(json.decode(data.body));
    
  //   return summary;
  // }

  Future<CountrySummaryModel> getCountrySummary() async{
    // final data = await http.get(Uri.parse("https://static.easysunday.com/covid-19/getTodayCases.json"));

    var url = Uri.parse('https://static.easysunday.com/covid-19/getTodayCases.json');
    
    final data = await http.get(url);
    print(data.body);

    CountrySummaryModel summary ;

    if(data.statusCode == 200){
      print("ok 1");
      summary = await CountrySummaryModel.fromJson(json.decode(data.body));
      print("ok 2");

    } else {
      throw Exception();
    }
    // print("summaryasdasda");

    // CountrySummaryModel summary = await new CountrySummaryModel.fromJson(json.decode(data.body));
    // print("ok");

    return summary;
  }
}
