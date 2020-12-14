import 'package:flutter/material.dart';

import '../../constant.dart';

class Confirmed extends StatelessWidget {
  const Confirmed({
    Key key,
    @required int confirmed,
    @required int newConfirmed,
  }) : _confirmed = confirmed, _newConfirmed = newConfirmed, super(key: key);

  final int _confirmed;
  final int _newConfirmed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
      padding: EdgeInsets.all(20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                comma(_confirmed.toString()),
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue[400],
                ),
              ),
              Text(
                " +${comma('$_newConfirmed')}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
          //SizedBox(height: 4,),
          Text(
            "Cases",
            style: TextStyle(fontSize: 16,color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}
