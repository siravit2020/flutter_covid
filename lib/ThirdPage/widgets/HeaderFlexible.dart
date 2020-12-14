import 'package:flutter/material.dart';
import 'package:flutter_covid/bloc_covid/result_data_global.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_covid/constant.dart';
import 'dart:math' as math;
class HeaderFlexible extends StatelessWidget {
  const HeaderFlexible({
    Key key,
    @required this.global,
  }) : super(key: key);

  final GlobalFetchData global;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyStatefulWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Global case",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20),
                ),
                Text(
                  '${comma(global.confirmed.toString())}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '+ ${comma(global.newConfirmed.toString())}',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: SvgPicture.asset(
              "assets/icons/worldwide.svg",
              height: 100,
              color: Colors.white,
            ),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}
