
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid/bloc_covid/covid_bloc.dart';
import 'package:flutter_covid/SecondPage/widgets/widgets.dart';
import 'package:flutter_covid/constant.dart';
import 'package:flutter_covid/SecondPage/widgets/HeaderFlexible.dart';

class CountryInThailand extends StatefulWidget {
  @override
  _CountryInThailandState createState() => _CountryInThailandState();
}

class _CountryInThailandState extends State<CountryInThailand>
    with AutomaticKeepAliveClientMixin<CountryInThailand> {
  // ignore: close_sinks
  VirusBloc _virusBloc;
  ScrollController _controller;

  String _date;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _virusBloc = BlocProvider.of<VirusBloc>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: c5,
        body: BlocBuilder(
            cubit: _virusBloc,
            builder: (BuildContext context, CovidState state) {
              var data = (state as FetchData).infoCase;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    brightness: Brightness.light,
                    backgroundColor: c5,
                    expandedHeight: 170,
                    elevation: 0,
                    leading: Icon(Icons.menu),
                    flexibleSpace: HeaderFlexible(),
                    actions: [
                      IconButton(icon: Icon(Icons.search), onPressed: () {})
                    ],
                  ),

                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        FrameShowList(data: data, controller: _controller),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}



