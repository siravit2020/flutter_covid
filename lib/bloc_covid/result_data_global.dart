import 'package:flutter_covid/database/covidDatabase.dart';

class GlobalFetchData {
  List<Country> country;
  int totalDeath;
  int newDeath;
  int confirmed;
  int recovered;
  int newRecovered;
  int newConfirmed;

  GlobalFetchData(
    this.country,
    this.totalDeath,
    this.newDeath,
    this.confirmed,
    this.newConfirmed,
    this.recovered,
    this.newRecovered,
  );

}
