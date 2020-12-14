import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant.dart';

class gender extends StatelessWidget {
  const gender({
    Key key,
    @required int male,
    @required int female,
  })  : _male = male,
        _female = female,
        super(key: key);

  final int _male;
  final int _female;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        sex(
          count: _male,
          color: Colors.lightBlue[400],
          gen: "male",
        ),
        sex(
          count: _female,
          color: Colors.pink[400],
          gen: "female",
        )
      ],
    );
  }
}

class sex extends StatelessWidget {
  final int count;
  final Color color;
  final String gen;

  const sex({Key key, this.count, this.color, this.gen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: gen == "male"
            ? EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 10)
            : EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 20),
        padding: EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
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
            SvgPicture.asset(
              gen == "male"
                  ? "assets/icons/masculine-user.svg"
                  : "assets/icons/one-woman.svg",
              color: color,
              width: 70,
            ),
            Column(
              children: [
                Text(
                  comma(count.toString()),
                  style: TextStyle(fontSize: 20, color: color),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
