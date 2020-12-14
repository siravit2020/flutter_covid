// To parse this JSON data, do
//
//     final infoCase = infoCaseFromJson(jsonString);

import 'dart:convert';

InfoCase infoCaseFromJson(String str) => InfoCase.fromJson(json.decode(str));

String infoCaseToJson(InfoCase data) => json.encode(data.toJson());

class InfoCase {
  InfoCase({
    this.data,
    this.lastData,
    this.updateDate,
    this.source,
    this.devBy,
    this.severBy,
  });

  List<Datum> data;
  DateTime lastData;
  String updateDate;
  String source;
  String devBy;
  String severBy;

  factory InfoCase.fromJson(Map<String, dynamic> json) => InfoCase(
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    lastData: DateTime.parse(json["LastData"]),
    updateDate: json["UpdateDate"],
    source: json["Source"],
    devBy: json["DevBy"],
    severBy: json["SeverBy"],
  );

  Map<String, dynamic> toJson() => {
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    "LastData": lastData.toIso8601String(),
    "UpdateDate": updateDate,
    "Source": source,
    "DevBy": devBy,
    "SeverBy": severBy,
  };
}

class Datum {
  Datum({
    this.confirmDate,
    this.no,
    this.age,
    this.gender,
    this.genderEn,
    this.nation,
    this.nationEn,
    this.province,
    this.provinceId,
    this.district,
    this.provinceEn,
    this.detail,
    this.statQuarantine,
  });

  DateTime confirmDate;
  String no;
  double age;
  Gender gender;
  GenderEn genderEn;
  Nation nation;
  NationEn nationEn;
  String province;
  int provinceId;
  String district;
  String provinceEn;
  dynamic detail;
  int statQuarantine;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    confirmDate: DateTime.parse(json["ConfirmDate"]),
    no: json["No"] == null ? null : json["No"],
    age: json["Age"].toDouble(),
    gender: genderValues.map[json["Gender"]],
    genderEn: genderEnValues.map[json["GenderEn"]],
    nation: nationValues.map[json["Nation"]],
    nationEn: json["NationEn"] == null ? null : nationEnValues.map[json["NationEn"]],
    province: json["Province"],
    provinceId: json["ProvinceId"],
    district: json["District"],
    provinceEn: json["ProvinceEn"],
    detail: json["Detail"],
    statQuarantine: json["StatQuarantine"],
  );

  Map<String, dynamic> toJson() => {
    "ConfirmDate": confirmDate.toIso8601String(),
    "No": no == null ? null : no,
    "Age": age,
    "Gender": genderValues.reverse[gender],
    "GenderEn": genderEnValues.reverse[genderEn],
    "Nation": nationValues.reverse[nation],
    "NationEn": nationEn == null ? null : nationEnValues.reverse[nationEn],
    "Province": province,
    "ProvinceId": provinceId,
    "District": district,
    "ProvinceEn": provinceEn,
    "Detail": detail,
    "StatQuarantine": statQuarantine,
  };
}

enum Gender { EMPTY, GENDER }

final genderValues = EnumValues({
  "ชาย": Gender.EMPTY,
  "หญิง": Gender.GENDER
});

enum GenderEn { MALE, FEMALE }

final genderEnValues = EnumValues({
  "Female": GenderEn.FEMALE,
  "Male": GenderEn.MALE
});

enum Nation { THAILAND, FRANCE, BANGLADESH, INDIA, RUSSIA, UNITED_STATESOF_AMERICA, BRAZIL, PHILIPPINES, UNITED_KINGDOM, ETHIOPIA, QATAR, SERBIA, FINLAND, EGYPT, SUDAN, CHINA, ITALY, GERMANY, BURMA, EMPTY, NATION, VIETNAM, MALAYSIA, YEMEN, CAMBODIA, MALI, PURPLE, LAOS, AUSTRALIA, PALESTINE, SINGAPORE, KAZAKHSTAN, ISRAEL, JAPAN, ALBANIA, NETHERLANDS, SWEDEN, MEXICO, TUNISIA, BELGIUM, KUWAIT, LIBERIA, HUNGARY, SWITZERLAND, PAKISTAN, CANADA, KOREA_SOUTH, TAIWAN, INDONESIA, INDIA_THAILAND, SPAIN, UZBEKISTAN, PORTUGAL, UKRAINE, DENMARK, NEW_ZEALAND, IRAN }

final nationValues = EnumValues({
  "Albania": Nation.ALBANIA,
  "Australia": Nation.AUSTRALIA,
  "Bangladesh": Nation.BANGLADESH,
  "Belgium": Nation.BELGIUM,
  "Brazil": Nation.BRAZIL,
  "Burma": Nation.BURMA,
  "Cambodia": Nation.CAMBODIA,
  "Canada": Nation.CANADA,
  "China": Nation.CHINA,
  "Denmark": Nation.DENMARK,
  "Egypt": Nation.EGYPT,
  "ต่างด้าว": Nation.EMPTY,
  "Ethiopia": Nation.ETHIOPIA,
  "Finland": Nation.FINLAND,
  "France": Nation.FRANCE,
  "Germany": Nation.GERMANY,
  "Hungary": Nation.HUNGARY,
  "India": Nation.INDIA,
  "India-Thailand": Nation.INDIA_THAILAND,
  "Indonesia": Nation.INDONESIA,
  "Iran": Nation.IRAN,
  "Israel": Nation.ISRAEL,
  "Italy": Nation.ITALY,
  "Japan": Nation.JAPAN,
  "Kazakhstan": Nation.KAZAKHSTAN,
  "Korea,South": Nation.KOREA_SOUTH,
  "Kuwait": Nation.KUWAIT,
  "Laos": Nation.LAOS,
  "Liberia": Nation.LIBERIA,
  "Malaysia": Nation.MALAYSIA,
  "Mali": Nation.MALI,
  "Mexico": Nation.MEXICO,
  "สหราชอาณาจักร": Nation.NATION,
  "Netherlands": Nation.NETHERLANDS,
  "NewZealand": Nation.NEW_ZEALAND,
  "Pakistan": Nation.PAKISTAN,
  "Palestine": Nation.PALESTINE,
  "Philippines": Nation.PHILIPPINES,
  "Portugal": Nation.PORTUGAL,
  "ไม่ทราบ": Nation.PURPLE,
  "Qatar": Nation.QATAR,
  "Russia": Nation.RUSSIA,
  "Serbia": Nation.SERBIA,
  "Singapore": Nation.SINGAPORE,
  "spain": Nation.SPAIN,
  "Sudan": Nation.SUDAN,
  "Sweden": Nation.SWEDEN,
  "Switzerland": Nation.SWITZERLAND,
  "Taiwan": Nation.TAIWAN,
  "Thailand": Nation.THAILAND,
  "Tunisia": Nation.TUNISIA,
  "Ukraine": Nation.UKRAINE,
  "UnitedKingdom": Nation.UNITED_KINGDOM,
  "UnitedStatesofAmerica": Nation.UNITED_STATESOF_AMERICA,
  "Uzbekistan": Nation.UZBEKISTAN,
  "Vietnam": Nation.VIETNAM,
  "Yemen": Nation.YEMEN
});

enum NationEn { BURMESE, BRITISH, UNKNOWN, KAZAKHSTANI, SWISS, SPAIN }

final nationEnValues = EnumValues({
  "British": NationEn.BRITISH,
  "Burmese": NationEn.BURMESE,
  "Kazakhstani": NationEn.KAZAKHSTANI,
  "Spain": NationEn.SPAIN,
  "Swiss": NationEn.SWISS,
  "Unknown": NationEn.UNKNOWN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
