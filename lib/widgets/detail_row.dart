import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailRow extends StatelessWidget {
  DetailRow({@required this.temp, this.date, this.humidity, this.icon});

  final String temp;
  final String date;
  final String humidity;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text((DateFormat.EEEE()
                .format((DateFormat("yyyy-MM-dd HH:mm:ss").parse(date)))
                .toString())),
          ),
          Expanded(
            child: Text((DateFormat.Hm()
                .format((DateFormat("yyyy-MM-dd HH:mm:ss").parse(date)))
                .toString())),
          ),
          Expanded(
            child: Text('${((num.parse(temp) - 272).toStringAsFixed(0))} C'),
          ),
          Expanded(
            child: SizedBox(
                width: 40,
                height: 40,
                child: Image.network(
                    'http://openweathermap.org/img/wn/$icon@2x.png')),
          ),

          // Expanded(
          //   child: Text('$humidity %'),
          // ),
        ],
      ),
    );
  }
}
