import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forcast/page/homeScreen.dart';
import 'package:weather_forcast/widgets/splashScreen_screen.dart';
import 'apis/api_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //                                     <--- MultiProvider
      providers: [
        ChangeNotifierProvider<Forecast>(create: (context) => Forecast()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(primaryColor: Colors.blue),
          home: Home(
            title: "Wetter",
          )

          //      SplashScreen(),
          // routes: <String, WidgetBuilder>{
          //   '/HomeScreen': (BuildContext context) => new Home(title: "Wetter",)
          // },

          ),
    );
  }
}
