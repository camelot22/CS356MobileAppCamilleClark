import 'package:best_dates/Screens/activityscreen1.dart';
import 'package:best_dates/Screens/restaurantscreen1.dart';
import 'package:best_dates/constants.dart';
import 'package:flutter/material.dart';


class HomeScreenBody extends StatelessWidget
{
  var homePageButtonTheme = ElevatedButton.styleFrom(
    elevation: 10.0,
    shadowColor: Colors.blue,
    textStyle: TextStyle(fontSize: 30.0, color: kLightTextColor, fontFamily: 'Comfortaa'),
    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    minimumSize: Size(250.0, 120.0),
  );


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //h&w of phone screen

    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Need some\ndate ideas?',
            style: TextStyle(fontSize: 40.0),
          ),
          SizedBox(
            height: kSpacingAmount,
            width: kSpacingAmount,
          ),

          Text(
            'Grab a',
            style: TextStyle(fontSize: 30.0),
          ),
          SizedBox(
            height: kSpacingAmount,
            width: kSpacingAmount,
          ),

          ElevatedButton(
            child: Text(
              "    RANDOM\nRESTAURANT",
              style: TextStyle(color: kLightTextColor),
            ),
            onPressed: ()
            {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RestaurantScreen1())
              );
            }, //TODO: improve upon push
            style: homePageButtonTheme,
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                SizedBox(
                  height: kSpacingAmount,
                  width: kSpacingAmount,
                ),
              ]
          ),

          ElevatedButton(
            child: Text(
              "RANDOM\nACTIVITY",
              style: TextStyle(color: kLightTextColor),
            ),
            onPressed: ()
            {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ActivityScreen1())
              );
            },
            style: homePageButtonTheme,
          ),


          SizedBox(
            height: kSpacingAmount,
            width: kSpacingAmount,
          ),

          Text(
              'from the date jar!',
              style: TextStyle(fontSize: 30.0),),
        ],
      ),
    );
  }
}