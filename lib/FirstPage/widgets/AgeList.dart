import 'package:flutter/material.dart';
import 'package:flutter_covid/bloc_covid/result_data.dart';
class AgeList extends StatelessWidget {
  const AgeList({
    Key key,
    @required this.infoCase,
  }) : super(key: key);

  final General infoCase;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Age(
          age: infoCase.ageMin,
          type: "L",
          title: "Youngest",
          color: Colors.orange[400],
          margin: EdgeInsets.only(
              top: 20, bottom: 5, left: 20, right: 5),
        ),
        Age(
          age: infoCase.ageAvg.toDouble(),
          type: "C",
          title: "Average",
          color: Colors.deepOrange[400],
          margin: EdgeInsets.only(
              top: 20, bottom: 5, left: 10, right: 10),
        ),
        Age(
          age: infoCase.ageMax,
          type: "L",
          title: "Oldest",
          color: Colors.red[400],
          margin: EdgeInsets.only(
              top: 20, bottom: 5, left: 5, right: 20),
        ),
      ],
    );
  }
}


class Age extends StatelessWidget {
  final double age;
  final String type;
  final String title;
  final Color color;
  final EdgeInsets margin;

  const Age({
    Key key,
    @required this.age,
    @required this.type,
    @required this.title,
    @required this.color,
    @required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String age = this.age.toStringAsFixed(0);
    String ageType = " Y";
    if (this.age < 0.12) {
      age = (this.age * 10).toStringAsFixed(0);
      ageType = " M";
    }

    // EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 10)
    return Expanded(
      child: Container(
        margin: margin,
        padding: EdgeInsets.only(top: 20, bottom: 20, right: 5, left: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 7),
                blurRadius: 10,
                color: Color(0xffe29578).withOpacity(0.2),
              )
            ]),
        child: Column(
          children: [
            Text(
              age + ageType,
              style: TextStyle(fontSize: 20, color: color),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }
}