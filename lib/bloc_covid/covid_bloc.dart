import 'dart:async';
import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_covid/database/thai_today.dart';
import 'package:flutter_covid/database/info_case.dart';
import 'package:flutter_covid/database/covidDatabase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_covid/bloc_covid/result_data.dart';
import 'package:flutter_covid/bloc_covid/result_data_global.dart';
import 'result_data.dart';

part 'covid_event.dart';

part 'covid_state.dart';

class VirusBloc extends Bloc<CovidEvent, CovidState> {
  VirusBloc() : super(InitialFirstPageState());

  @override
  Stream<CovidState> mapEventToState(CovidEvent event) async* {
    if (event is Start) {
      var today = getThailandToday();
      var infoCase = getThailandInfoCase();
      var global = getGlobal();
      ThaiToday r = await today.then((value) => value);

      General i = await infoCase.then((value) => sortData(value));

      GlobalFetchData g = await global.then((value) {
        var global = value.global;
        
        List<Country> _country;
        _country = value.countries;
        _country.forEach((element) {});
        _country.sort((a, b) => b.totalConfirmed.compareTo(a.totalConfirmed));
        return GlobalFetchData(
          _country,
          global.totalDeaths,
          global.newDeaths,
          global.totalConfirmed,
          global.newConfirmed,
          global.totalRecovered,
          global.newRecovered,
        );
      });

      yield FetchData(r, i, g);
    }
  }
}

General sortData(value) {
  int male = 0;
  int female = 0;
  List<double> _listAge = [];
  var av = 0.0;
  Map<String, int> _statCountry = {};
  SplayTreeMap _stateCountryFinal;
  List<String> _nameCountry = [];
  value.data.forEach((element) {
    if (element.genderEn == GenderEn.MALE) male++;
    if (element.genderEn == GenderEn.FEMALE) female++;
    var age = element.age;
    if (age != 0.0) {
      _listAge.add(age);
      av = av + age;
    }
    if (element.statQuarantine == 1) {
      var key = element.provinceEn;
      if (_statCountry.containsKey(key)) {
        _statCountry.update(key, (value) => value + 1);
      } else {
        _statCountry[key] = 1;
      }
    }
  });
  var max = _listAge.reduce((curr, next) => curr > next ? curr : next);
  var min = _listAge.reduce((curr, next) => curr < next ? curr : next);
  var avg = av ~/ _listAge.length;
  _stateCountryFinal = SplayTreeMap.from(_statCountry,
      (key1, key2) => _statCountry[key2].compareTo(_statCountry[key1]));
  _stateCountryFinal.forEach((key, value) {
    _nameCountry.add(key);
  });
  return General(max, min, avg, value.updateDate, male, female,
      _stateCountryFinal, _nameCountry);
}

Future<ThaiToday> getThailandToday() async {
  try {
    Response response =
        await Dio().get("https://covid19.th-stat.com/api/open/today");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return thaiTodayFromJson(response.toString());
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  } catch (e) {
    print(e);
  }
}

Future<InfoCase> getThailandInfoCase() async {
  try {
    Response response =
        await Dio().get("https://covid19.th-stat.com/api/open/cases");

    if (response.statusCode == 200) {
      return infoCaseFromJson(response.toString());
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  } catch (e) {
    print(e);
  }
}

Future<CovidDatabase> getGlobal() async {
  try {
    Response response = await Dio().get("https://api.covid19api.com/summary");

    if (response.statusCode == 200) {
      return covidDatabaseFromJson(response.toString());
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  } catch (e) {
    print(e);
  }
}
