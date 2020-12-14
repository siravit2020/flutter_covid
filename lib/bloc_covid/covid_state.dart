

part of 'covid_bloc.dart';




abstract class CovidState {}

class InitialFirstPageState extends CovidState {
  @override
  String toString() {
    return "InitialCounterState";
  }
}
class FetchData extends CovidState {
  final ThaiToday today;
  final General infoCase;
  final GlobalFetchData global;

  FetchData(this.today, this.infoCase,this.global);

}