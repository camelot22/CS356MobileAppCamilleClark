import 'package:best_dates/Objects/activityarguments.dart';
import 'package:best_dates/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Text(
              args.activity.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              )
            ),
            SizedBox(
              height: kSpacingAmount,
              width: kSpacingAmount,
            ),


            Container(
              width: double.infinity,
              height: 200.0,
              child: Image.network(args.activity.imageURL),
            ),
            SizedBox(
              height: kSpacingAmount,
              width: kSpacingAmount,
            ),


            Text("Activity Type: " + args.activity.type),
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
            Text(
              args.activity.description != null ? args.activity.description : "Description coming soon!",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: kSpacingAmount,
              width: kSpacingAmount,
            ),

          ],
        )
    );
  }

}