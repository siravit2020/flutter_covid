import 'package:flutter/material.dart';
import 'package:flutter_covid/ThirdPage/widgets/widgets.dart';
import 'package:flutter_covid/bloc_covid/result_data_global.dart';
import 'package:flutter_covid/constant.dart';

class GlobalListItem extends StatelessWidget {
  const GlobalListItem({
    Key key,
    @required ScrollController controller,
    @required this.global,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;
  final GlobalFetchData global;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 50,
      ),
      padding: EdgeInsets.only(top: 70),
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          )),
      child: Column(
        children: [
          
          ExplainBar(),
          ListView.builder(
            controller: _controller,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      global.country[index].country,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff006d77),
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemBox(
                            Colors.orange[400],
                            comma(
                                '${global.country[index].totalConfirmed.toString()}'),
                            comma(
                                '${global.country[index].newConfirmed.toString()}')),
                        SizedBox(
                          height: 6,
                        ),
                        itemBox(
                            Colors.red[400],
                            comma(
                                '${global.country[index].totalDeaths.toString()}'),
                            comma(
                                '${global.country[index].newDeaths.toString()}')),
                        SizedBox(
                          height: 6,
                        ),
                        itemBox(
                            Colors.green[400],
                            comma(
                                '${global.country[index].totalRecovered.toString()}'),
                            comma(
                                '${global.country[index].newRecovered.toString()}')),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: global.country.length,
          ),
        ],
      ),
    );
  }

  Row itemBox(Color color, String count, String increase) {
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
          width: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: 18,
                color: color,
              ),
            ),
            Text(
              ' +$increase',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
