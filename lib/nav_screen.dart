import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid/constant.dart';
import 'package:flutter_covid/screens.dart';
import 'package:flutter_covid/widgets/customm_tab_bar_button.dart';
import 'package:flutter_covid/bloc_covid/covid_bloc.dart';
import 'package:flutter_covid/constant.dart';
import "package:flutter_svg/flutter_svg.dart";
class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  VirusBloc _firstPageBloc;
  final List<Widget> _screens = [
    Thailand(),
    CountryInThailand(),
    WWW(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.list,
    Icons.public,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    _firstPageBloc = BlocProvider.of<VirusBloc>(context);
    return SafeArea(

      child: BlocBuilder(
        cubit: _firstPageBloc,
        builder: (BuildContext context, CovidState state) {
          if (state is InitialFirstPageState) _firstPageBloc.add(Start());
          if (state is FetchData)
          return DefaultTabController(length: _icons.length, child: Scaffold(
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: _screens,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: CustomTabBar(
                icons: _icons,
                selectedIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index),
              ),
            ),
          ));
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
        }

      ),
    );
  }
}
