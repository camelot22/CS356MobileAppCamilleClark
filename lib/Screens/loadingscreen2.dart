import 'dart:async';

import 'package:best_dates/Objects/activityarguments.dart';
import 'package:best_dates/Screens/activityscreen2.dart';
import 'package:flutter/material.dart';
import 'package:best_dates/constants.dart';
import 'package:flutter/widgets.dart';

class ActivityLoadingScreen extends StatefulWidget
{
  static const routeName = '/loadingScreenActivity';

  @override
  _ActivityLoadingScreenState createState() => _ActivityLoadingScreenState();
}



class _ActivityLoadingScreenState extends State<ActivityLoadingScreen> with SingleTickerProviderStateMixin {
  //variables don't have to be final since you aren't extening Widget
  AnimationController _animationController;
  ActivityArguments args;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );
    super.initState();

    _animationController.repeat();

    Timer(Duration(milliseconds: 1800), () {
      Navigator.pushReplacementNamed(
        context,
        ActivityScreen2.routeName,
        arguments: args,
      );
    });
  }



  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context)
  {
    args = ModalRoute.of(context).settings.arguments;
    //void star

    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
        backgroundColor: kAppBarColor,
        //shadowColor: Colors.transparent,
      ),
      body: loadingScreenBody(),
    );
  }

  Widget loadingScreenBody() {
    return Center(
      child: RotationTransition(
          turns: Tween(begin: 0.0, end: 3.0).animate(_animationController),
          child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(62.0)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.deepPurple,
                    Colors.pink
                  ],
                  //tileMode: TileMode.repeated,
                ),
              )
          )
      ),

    );
  }
}