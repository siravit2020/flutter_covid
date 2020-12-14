import 'dart:convert';

SumCase sumCaseFromJson(String str) => SumCase.fromJson(json.decode(str));

String sumCaseToJson(SumCase data) => json.encode(data.toJson());

class SumCase {
  SumCase({
    this.province,
    this.nation,
    this.gender,
    this.lastData,
    this.updateDate,
    this.source,
    this.devBy,
    this.severBy,
  });

  Map<String, int> province;
  Nation nation;
  Gender gender;
  DateTime lastData;
  String updateDate;
  String source;
  String devBy;
  String severBy;

  factory SumCase.fromJson(Map<String, dynamic> json) => SumCase(
    province: Map.from(json["Province"]).map((k, v) => MapEntry<String, int>(k, v)),
    nation: Nation.fromJson(json["Nation"]),
    gender: Gender.fromJson(json["Gender"]),
    lastData: DateTime.parse(json["LastData"]),
    updateDate: json["UpdateDate"],
    source: json["Source"],
    devBy: json["DevBy"],
    severBy: json["SeverBy"],
  );

  Map<String, dynamic> toJson() => {
    "Province": Map.from(province).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "Nation": nation.toJson(),
    "Gender": gender.toJson(),
    "LastData": lastData.toIso8601String(),
    "UpdateDate": updateDate,
    "Source": source,
    "DevBy": devBy,
    "SeverBy": severBy,
  };
}

class Gender {
  Gender({
    this.male,
    this.female,
  });

  int male;
  int female;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    male: json["Male"],
    female: json["Female"],
  );

  Map<String, dynamic> toJson() => {
    "Male": male,
    "Female": female,
  };
}

class Nation {
  Nation({
    this.unknown,
    this.burmese,
    this.swiss,
    this.kazakhstani,
    this.spain,
    this.british,
  });

  int unknown;
  int burmese;
  int swiss;
  int kazakhstani;
  int spain;
  int british;

  factory Nation.fromJson(Map<String, dynamic> json) => Nation(
    unknown: json["Unknown"],
    burmese: json["Burmese"],
    swiss: json["Swiss"],
    kazakhstani: json["Kazakhstani"],
    spain: json["Spain"],
    british: json["British"],
  );

  Map<String, dynamic> toJson() => {
    "Unknown": unknown,
    "Burmese": burmese,
    "Swiss": swiss,
    "Kazakhstani": kazakhstani,
    "Spain": spain,
    "British": british,
  };
}
