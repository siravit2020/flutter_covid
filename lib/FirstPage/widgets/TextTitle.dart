import 'package:flutter/material.dart';
class TextTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final String date;

  const TextTitle({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(child: DonutPieChart.withSampleData(),width: 150,height: 150,),
          Text(
            title,
            style: TextStyle(color: Color(0xff006d77), fontSize: 25),
          ),
          Text(
            subTitle + date,
            style: TextStyle(
                color: Color(0xff006d77).withOpacity(0.5), fontSize: 15),
          ),
        ],
      ),
    );
  }
}