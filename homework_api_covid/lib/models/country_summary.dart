class CountrySummaryModel{
  final String country;
  final int todayCases;
  final int deaths;
  final int recovered;
  final int active;
  final String date;

  CountrySummaryModel(this.country, this.todayCases, this.deaths, this.recovered, this.active, this.date);

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json){
    return CountrySummaryModel(
      json["country"],
      json["todayCases"],
      json["deaths"],
      json["recovered"],
      json["active"],
      json["UpdateDate"],
    );
  }
  
}