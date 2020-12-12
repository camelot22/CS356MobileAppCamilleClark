import 'package:best_dates/Screens/activityscreen1.dart';
import 'package:best_dates/Screens/activityscreen2.dart';
import 'package:best_dates/Screens/homescreen2.dart';
import 'package:best_dates/Screens/loadingscreen.dart';
import 'package:best_dates/Screens/loadingscreen2.dart';
import 'package:best_dates/Screens/restaurantscreen1.dart';
import 'package:best_dates/Screens/restaurantscreen2.dart';
import 'package:flutter/material.dart';
import 'package:best_dates/constants.dart';
import 'package:flutter/services.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((_) {
    runApp(MyApp());
  });

}

class MyApp extends StatelessWidget
{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //get rid of the banner thing
      title: 'Get date ideas!',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,

        // Define the default colors.
        primarySwatch: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,

        // Define the default font family.
        //fontFamily: 'Arial',

        // Define the default TextTheme
        fontFamily: 'Comfortaa',

        //TODO: theme for raised buttons

      ),
      home: HomeScreen2(),
      routes: {
        RestaurantScreen1.routeName: (context) => RestaurantScreen1(),
        RestaurantScreen2.routeName: (context) => RestaurantScreen2(),
        RestaurantLoadingScreen.routeName: (context) => RestaurantLoadingScreen(),
        ActivityScreen1.routeName: (context) => ActivityScreen1(),
        ActivityScreen2.routeName: (context) => ActivityScreen2(),
        ActivityLoadingScreen.routeName: (context) => ActivityLoadingScreen(),
      }

    );
  }
}