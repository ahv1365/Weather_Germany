import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_forcast/apis/api_model.dart';

class CurrentWeather extends StatelessWidget {
  CurrentWeather({Key key, this.city});

  final String city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          
          
          city.toUpperCase(), style: Theme.of(context).textTheme.headline4),
        Divider(
          color: Colors.grey,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text((DateFormat.yMMMMEEEEd().format(DateTime.now()))
                    .toString()),
                SizedBox(
                  height: 10,
                ),
                Consumer<Forecast>(
                  //            <--- Forecast Consumer

                  builder: (context, current, child) {
                    return Text(current?.forecastData["weather"][0]['main'],
                        style: Theme.of(context).textTheme.headline4);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<Forecast>(
                  //            <--- Forecast Consumer

                  builder: (context, current, child) {
                    return Text(
                      "Aktuelle Temperatur: ${((current?.forecastData["main"]['temp']).toStringAsFixed(0))} C",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Consumer<Forecast>(
                        //            <--- Forecast Consumer

                        builder: (context, current, child) {
                          return Image.network(
                              'http://openweathermap.org/img/wn/${current?.forecastData["weather"][0]['icon']}@2x.png');
                        },
                      ),
                    ),
                  ),
                ),
                Row(children: [
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.red,
                    size: 24.0,
                  ),
                  Consumer<Forecast>(
                    //            <--- Forecast Consumer

                    builder: (context, current, child) {
                      return Text(
                        "${((current?.forecastData["main"]['temp_max']).toStringAsFixed(0))}",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                    size: 24.0,
                  ),
                  Consumer<Forecast>(
                    //            <--- Forecast Consumer

                    builder: (context, current, child) {
                      return Text(
                        "${((current?.forecastData["main"]['temp_min']).toStringAsFixed(0))}",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ]),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          color: Colors.green,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[



Column(
  children: <Widget>[
     SizedBox(
                  height: 20,
                ),
        Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                        size: 24.0,
                      ),
                       SizedBox(
                  height: 30,
                ),
 
                  Icon(
                    Icons.cloud,
                    color: Colors.grey,
                    size: 24.0,
                  ),

                   SizedBox(
                  height: 30,
                ),
                  Icon(
                    Icons.format_color_reset,
                    color: Colors.blueAccent,
                    size: 24.0,
                  ),
                   SizedBox(
                  height: 30,
                ),
                  
                  Icon(
                    Icons.import_export,
                    color: Colors.orange,
                    size: 24.0,
                  ),
                   SizedBox(
                  height: 20,
                ), ],
),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sunrise",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<Forecast>(
                  //            <--- Forecast Consumer

                  builder: (context, current, child) {
                    return Text(
                      DateFormat('hh:mm a').format(
                          new DateTime.fromMillisecondsSinceEpoch(
                              (current?.forecastData['sys']['sunrise']) *
                                  1000)),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Chance of rain",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<Forecast>(
                  //            <--- Forecast Consumer

                  builder: (context, current, child) {
                    return Text(
                      "${((current?.forecastData["main"]['temp']).toStringAsFixed(0))} C",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Humidity",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<Forecast>(
                  //            <--- Forecast Consumer

                  builder: (context, current, child) {
                    return Text(
                      "${((current?.forecastData["main"]['humidity']).toStringAsFixed(0))}%",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Pressure",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<Forecast>(
                  //            <--- Forecast Consumer

                  builder: (context, current, child) {
                    return Text(
                      "${((current?.forecastData["main"]['pressure']).toStringAsFixed(0))}hpa",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),



Column(
  children: <Widget>[
     SizedBox(
                  height: 20,
                ),
        Icon(
                        Icons.brightness_3,
                        color: Colors.black,
                        size: 24.0,
                      ),
                       SizedBox(
                  height: 30,
                ),
 
                  Icon(
                    Icons.filter_drama,
                    color: Colors.black12,
                    size: 24.0,
                  ),

                   SizedBox(
                  height: 30,
                ),
                  Icon(
                    Icons.forward,
                    color: Colors.greenAccent[100],
                    size: 24.0,
                  ),
                   SizedBox(
                  height: 30,
                ),
                  
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.brown[300],
                    size: 24.0,
                  ),
                   SizedBox(
                  height: 20,
                ), ],
),


            Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sunset",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<Forecast>(
                  //            <--- Forecast Consumer

                  builder: (context, current, child) {
                    return Text(
                      DateFormat('hh:mm a').format(
                          new DateTime.fromMillisecondsSinceEpoch(
                              (current?.forecastData['sys']['sunset']) * 1000)),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Clouds",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<Forecast>(
                  //            <--- Forecast Consumer

                  builder: (context, current, child) {
                    return Text(
                      "${((current?.forecastData["clouds"]['all']).toStringAsFixed(0))}%",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Wind",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<Forecast>(
                  //            <--- Forecast Consumer

                  builder: (context, current, child) {
                    return Text(
                      "${((current?.forecastData["wind"]['speed']).toStringAsFixed(0))} Kmh",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Visibility",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<Forecast>(
                  //            <--- Forecast Consumer

                  builder: (context, current, child) {
                    return Text(
                      "${(((current?.forecastData["visibility"]) / 1000).toStringAsFixed(0))} Km",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
