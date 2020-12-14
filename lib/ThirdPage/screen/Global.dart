import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid/bloc_covid/covid_bloc.dart';
import 'package:flutter_covid/constant.dart';
import 'package:flutter_covid/ThirdPage/widgets/widgets.dart';

class WWW extends StatefulWidget {
  @override
  _WWWState createState() => _WWWState();
}

class _WWWState extends State<WWW> with AutomaticKeepAliveClientMixin<WWW> {
  VirusBloc _virusBloc;
  var _context;
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    _virusBloc = BlocProvider.of<VirusBloc>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: c5,
        body: BlocBuilder(
            cubit: _virusBloc,
            builder: (BuildContext context, CovidState state) {
              var global = (state as FetchData).global;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    brightness: Brightness.light,
                    backgroundColor: Color(0xFFe29578),
                    elevation: 0,
                    centerTitle: false,
                    expandedHeight: 170,
                    flexibleSpace: HeaderFlexible(global: global),
                    leading: Icon(Icons.menu),
                    actions: [
                      IconButton(icon: Icon(Icons.search), onPressed: () {})
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            GlobalListItem(
                                controller: _controller, global: global),
                            GlobalBanner(global: global),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
