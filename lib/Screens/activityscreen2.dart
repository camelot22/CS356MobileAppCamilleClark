import 'dart:math';

import 'package:best_dates/Objects/activityarguments.dart';
import 'package:best_dates/constants.dart';
import 'package:flutter/material.dart';
import 'package:best_dates/Objects/activity.dart';

class ActivityScreen2 extends StatelessWidget
{
  static const routeName = '/activity2';

  @override
  Widget build(BuildContext context) {
    final ActivityArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(args, context),
    );
  }


  Widget _buildBody(ActivityArguments args, BuildContext context)
  {
    // get a random result
    int length = args.activities.length;
    Random random = new Random();
    int randomIndex = random.nextInt(length);
    DateActivity activity = args.activities[randomIndex];

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  SizedBox(
                    height: kSpacingAmount,
                    width: kSpacingAmount,
                  ),
                ]
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                  activity.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  )
              ),
            ),
            SizedBox(
              height: kSpacingAmount,
              width: kSpacingAmount,
            ),


            Container( //IMAGE OF FOOD
              width: size.width * .9, // 90% of the screen
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    image: NetworkImage(activity.imageURL),
                  )
              ),
            ),
            SizedBox(
              height: kSpacingAmount,
              width: kSpacingAmount,
            ),


            Text("Activity Type: " + activity.type),
            SizedBox(
              height: kSpacingAmount,
              width: kSpacingAmount,
            ),

            Text(
              "Description",
              style: TextStyle(
                fontSize: 20.0,
              )
            ),
            SizedBox(
              height: kGapHeight,
              width: kGapWidth,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                activity.description != null ? activity.description : "Description coming soon!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(.7)
                ),
              ),
            ),
            SizedBox(
              height: kSpacingAmount,
              width: kSpacingAmount,
            ),

            ElevatedButton(
              onPressed: () => pressed(context, args, randomIndex, length),
              child: Text(
                  "I don't like this, give me another."
              ),
            ),
            SizedBox(
              height: kSpacingAmount,
              width: kSpacingAmount,
            ),

          ],
        )
    );
  }

  void pressed(BuildContext context, ActivityArguments args, int randomIndex, int length) {
    if (length == 1) {
      Navigator.pop(context);
    }
    else {
      args.activities.removeAt(randomIndex);
      Navigator.of(context).pushReplacementNamed(routeName, arguments: args);
    }
  }

}