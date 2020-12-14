part of 'covid_bloc.dart';

@immutable
abstract class CovidEvent {}


class Start extends CovidEvent{
  @override
  String toString() {
    return "First_start".toString();
  }
}