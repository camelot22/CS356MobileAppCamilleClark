import 'package:flutter/material.dart';
import 'package:best_dates/Screens/activityscreen1.dart';
import 'package:best_dates/Screens/restaurantscreen1.dart';
import 'package:best_dates/constants.dart';

class HomeScreen2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text('Date Options Home Page')
      ),
      body: buildHomeScreen2Body(context)
    );
  }
}


Widget buildHomeScreen2Body(BuildContext context)
{
  Size size = MediaQuery.of(context).size;

  return Center(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              height: 150,
              width: size.width * .9,
              margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'What do you need for your date?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      //color: Colors.white,
                    )
                ),
              )
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RestaurantScreen1())
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[

                Container(
                  height: 60.0,
                  width: size.width * .9, // 90% of the screen
                  alignment: Alignment.center,
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.deepPurple
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 7,
                          offset: Offset(0, 3),
                          color: Colors.grey.withOpacity(.3)
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50.0),

                  ),
                ),

                Text(
                  'Restaurant & Dessert Ideas',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white
                  ),
                ),

              ],
            ),
          ),

          SizedBox(
            height: 30.0,
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ActivityScreen1())
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[

                Container(
                  height: 60.0,
                  width: size.width * .9, // 90% of the screen
                  alignment: Alignment.center,
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.deepPurple
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 7,
                          offset: Offset(0, 3),
                          color: Colors.grey.withOpacity(.3)
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),

                Text(
                  'Date Activity Ideas',
                  style: TextStyle(
                    // fontFamily: 'Alanis',
                    fontSize: 22.0,
                    color: Colors.white
                  ),
                ),

              ],
            ),
          ),
        ],
      ),

  );
}