import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid/bloc_covid/covid_bloc.dart';
import 'package:flutter_covid/constant.dart';
import 'package:flutter_covid/widgets/widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_covid/bloc_covid/covid_bloc.dart';
import 'package:flutter_covid/FirstPage/widgets/widgets.dart';

class Thailand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Create(),
    );
  }
}

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create>
    with AutomaticKeepAliveClientMixin<Create> {
  VirusBloc _firstPageBloc;

  var _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    _firstPageBloc = BlocProvider.of<VirusBloc>(context);
    return Scaffold(
      backgroundColor: Color(0xffffddd2).withOpacity(0.1),
      body: BlocBuilder(
          cubit: _firstPageBloc,
          builder: (BuildContext context, CovidState state) {
            if (state is InitialFirstPageState) _firstPageBloc.add(Start());
            if (state is FetchData) {
              var today = state.today;
              var infoCase = state.infoCase;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    brightness: Brightness.light,
                    backgroundColor: Color(0xFFe29578),
                    expandedHeight: 170,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    leading: Icon(Icons.menu),
                    flexibleSpace: HeaderFlexible(),
                    actions: [
                      IconButton(icon: Icon(Icons.search), onPressed: () {})
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: TextTitle(
                      title: 'Situation Reports',
                      subTitle: 'Last update : ',
                      date: today.updateDate,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Confirmed(
                        confirmed: today.confirmed,
                        newConfirmed: today.newRecovered),
                  ),
                  SliverToBoxAdapter(
                    child: status(
                      hospital: today.hospitalized,
                      newHospital: today.newHospitalized,
                      totalDeath: today.deaths,
                      newDeath: today.newDeaths,
                      recovered: today.recovered,
                      newRecovered: today.newRecovered,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextTitle(
                      title: "General",
                      subTitle: 'Last update : ',
                      date: infoCase.date,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: gender(male: infoCase.male, female: infoCase.female),
                  ),
                  SliverToBoxAdapter(
                    child: AgeList(infoCase: infoCase),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  )
                ],
              );
            }
            return Container(
              color: c5,
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/giant.svg",
                  width: 100,
                  color: Colors.white,
                ),
              ),
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


