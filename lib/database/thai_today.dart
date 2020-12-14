// To parse this JSON data, do
//
//     final thaiToday = thaiTodayFromJson(jsonString);

import 'dart:convert';

ThaiToday thaiTodayFromJson(String str) => ThaiToday.fromJson(json.decode(str));

String thaiTodayToJson(ThaiToday data) => json.encode(data.toJson());

class ThaiToday {
  ThaiToday({
    this.confirmed,
    this.recovered,
    this.hospitalized,
    this.deaths,
    this.newConfirmed,
    this.newRecovered,
    this.newHospitalized,
    this.newDeaths,
    this.updateDate,
    this.source,
    this.devBy,
    this.severBy,
  });

  int confirmed;
  int recovered;
  int hospitalized;
  int deaths;
  int newConfirmed;
  int newRecovered;
  int newHospitalized;
  int newDeaths;
  String updateDate;
  String source;
  String devBy;
  String severBy;

  factory ThaiToday.fromJson(Map<String, dynamic> json) => ThaiToday(
    confirmed: json["Confirmed"],
    recovered: json["Recovered"],
    hospitalized: json["Hospitalized"],
    deaths: json["Deaths"],
    newConfirmed: json["NewConfirmed"],
    newRecovered: json["NewRecovered"],
    newHospitalized: json["NewHospitalized"],
    newDeaths: json["NewDeaths"],
    updateDate: json["UpdateDate"],
    source: json["Source"],
    devBy: json["DevBy"],
    severBy: json["SeverBy"],
  );

  Map<String, dynamic> toJson() => {
    "Confirmed": confirmed,
    "Recovered": recovered,
    "Hospitalized": hospitalized,
    "Deaths": deaths,
    "NewConfirmed": newConfirmed,
    "NewRecovered": newRecovered,
    "NewHospitalized": newHospitalized,
    "NewDeaths": newDeaths,
    "UpdateDate": updateDate,
    "Source": source,
    "DevBy": devBy,
    "SeverBy": severBy,
  };
}
