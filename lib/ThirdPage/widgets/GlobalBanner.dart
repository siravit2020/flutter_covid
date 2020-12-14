import 'package:flutter/material.dart';
import 'package:flutter_covid/bloc_covid/result_data_global.dart';
import 'package:flutter_covid/constant.dart';

class GlobalBanner extends StatelessWidget {
  const GlobalBanner({
    Key key,
    @required this.global,
  }) : super(key: key);

  final GlobalFetchData global;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
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
            child: Row(
              children: [
                text(
                  Colors.green[400],
                  "Recovered",
                  comma(global.recovered.toString()),
                  "+${comma(global.newRecovered.toString())}",
                ),
                text(
                  Colors.red[400],
                  "Died",
                  comma(global.totalDeath.toString()),
                  "+${comma(global.newDeath.toString())}",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded text(Color color, String type, String count, String increase) {
    return Expanded(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                count,
                style: TextStyle(
                  fontSize: 26,
                  color: color,
                ),
              ),
              Text(
                increase,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            type,
            style: TextStyle(fontSize: 16, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}
