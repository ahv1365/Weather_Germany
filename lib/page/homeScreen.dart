import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_forcast/apis/api_model.dart';
import 'package:weather_forcast/widgets/box_container.dart';
import 'package:weather_forcast/widgets/currentWeather.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title, this.refreshbtn = false}) : super(key: key);

  final String title;
  bool refreshbtn;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String _city;

  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      floatingActionButton:
          Consumer<Forecast>(//            <--- Forecast Consumer

              builder: (context, forecast, child) {
        return FloatingActionButton(
          backgroundColor: Colors.black54,
          tooltip: 'Refresh Data',
          onPressed: () {
            // Future.delayed(
            //     Duration(seconds: 2),
            //     () => setState(() {
            //           widget.refreshbtn = true;
            //         }));

            forecast?.forecast(_city);
          },
          child: Icon(Icons.refresh),
        );
      }),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.25,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 7 < num.parse(DateFormat('kk').format(DateTime.now())) &&
                      num.parse(DateFormat('kk').format(DateTime.now())) < 18
                  ? AssetImage("assets/sun.png")
                  : AssetImage("assets/moon.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Consumer<Forecast>(//            <--- Forecast Consumer

                  builder: (context, forecast, child) {
                return BoxContainer(
                  child: forecast.refreshbtn
                      ? CurrentWeather(
                          city: _city,
                        )
                      : Center(
                          child: Text(
                              (DateFormat.yMMMMEEEEd().format(DateTime.now()))
                                  .toString(),
                              style: Theme.of(context).textTheme.headline5),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
      appBar: buildCustomAppBar(context),
    );
  }

  PreferredSize buildCustomAppBar(BuildContext context) {
    return PreferredSize(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Material(
                shadowColor: Colors.black,
                color: Colors.blueGrey[100],
                child: LimitedBox(
                  maxHeight: MediaQuery.of(context).size.height / 9,
                  child: NavigationToolbar(
                    // leading: IconButton(
                    //   icon: Icon(Icons.dehaze),
                    //   onPressed: () {
                    //     print(_scaffoldKey.currentState.hasDrawer);
                    //     _scaffoldKey.currentState.openDrawer();
                    //   },
                    // ),
                    middle: TextField(
                      cursorColor: Colors.orange,
                      controller: _controller,
                      onSubmitted: (String value) {
                        setState(() {
                          _city = value;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        filled: true,
                        fillColor: Colors.white70,
                        hoverColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Stadt',
                        hintText: 'Stadt eingeben',
                      ),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    trailing: Consumer<Forecast>(
                      //            <--- Forecast Consumer

                      builder: (context, forecast, child) {
                        return IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Future.delayed(
                            //     Duration(seconds: 2),
                            //     () => setState(() {
                            //           _refresh = true;
                            //         }));

                            forecast?.forecast(_city);
                          },
                        );
                      },
                    ),
                  ),
                ),
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(kToolbarHeight * 2 - 8.0),
    );
  }
}
