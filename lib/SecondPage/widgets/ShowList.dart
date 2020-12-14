import 'package:flutter/material.dart';
import 'package:flutter_covid/bloc_covid/result_data.dart';
class ShowList extends StatelessWidget {
  const ShowList({
    Key key,
    @required ScrollController controller,
    @required this.data,
  }) : _controller = controller, super(key: key);

  final ScrollController _controller;
  final General data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin:
          EdgeInsets.only(bottom: 15,),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.name[index],
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff006d77),
                ),
              ),
              Text(
                " ${data.country[data.name[index]]}",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFe29578),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: data.country.length,
    );
  }
}