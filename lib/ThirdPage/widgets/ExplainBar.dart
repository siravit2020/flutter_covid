import 'package:flutter/material.dart';

class ExplainBar extends StatelessWidget {
  const ExplainBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      width: double.infinity,
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
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(child: DonutPieChart.withSampleData(),width: 150,height: 150,),
                Text(
                  'Country',
                  style: TextStyle(color: Color(0xff006d77), fontSize: 25),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildRow(
                Colors.orange[400],
                "Confirmed",
              ),
              buildRow(
                Colors.red[400],
                "Died",
              ),
              buildRow(
                Colors.green[400],
                "Recovered",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildRow(color, text) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(color: color),
        )
      ],
    );
  }
}
