import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class HeaderFlexible extends StatelessWidget {
  const HeaderFlexible({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/giant.svg",
            width: 100,
            color: Colors.white,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'COVID-19',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                  Text(
                    'situation in Thailand',
                    style: TextStyle(
                        
                        fontSize: 20,
                        color: Colors.white54),
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
