import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:flutter_covid/bloc_covid/result_data.dart';
import 'package:flutter_covid/constant.dart';
class FrameShowList extends StatelessWidget {
  const FrameShowList({
    Key key,
    @required this.data,
    @required ScrollController controller,
  }) : _controller = controller, super(key: key);

  final General data;
  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          )),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: 20, right: 20, top: 40, bottom: 0),
            child: Column(
              children: [
                // Container(child: DonutPieChart.withSampleData(),width: 150,height: 150,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 40),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      // Container(child: DonutPieChart.withSampleData(),width: 150,height: 150,),
                      Text(
                        'State quarantine',
                        style: TextStyle(
                            color: Color(0xff006d77),
                            fontSize: 25),
                      ),
                      Text(
                        'Last update : ' + data.date,
                        style: TextStyle(
                            color: Color(0xff006d77)
                                .withOpacity(0.5),
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                ShowList(
                    controller: _controller, data: data),
              ],
            ),
          ),
        ],
      ),
    );
  }
}