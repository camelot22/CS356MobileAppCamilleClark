import 'package:flutter/material.dart';
import 'package:best_dates/constants.dart';
import 'dart:async';
import 'package:best_dates/Screens/homescreen2.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open the Date Jar!'),
        backgroundColor: kAppBarColor,
        //shadowColor: Colors.transparent,
      ),
      body: HomeScreenBody(),
    );
  }

}


////////////////////////////////////////////////////////////////////////
class HomeScreenBody extends StatefulWidget
{
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}


////////////////////////////////////////////////////////////////////////
class _HomeScreenBodyState extends State<HomeScreenBody>  {
  double _lidOffset = 200.0;
  final int _animationTime = 400;
  Color _lidColor = Colors.grey;
  double _popsicleOffset = 0.0;
  final int _animationPopsicle = 700;


  void updateState() {
    setState(() {
      _lidOffset = 250.0;
      _lidColor = Colors.transparent;
    });
  }

  void updateState2() {
    setState(() {
      _popsicleOffset = 700.0;
    });
  }

  void updateState3() {
    setState(() {
      _lidOffset = 200;
      _popsicleOffset = 0.0;
      _lidColor = Colors.grey;
    });
  }


  var homePageButtonTheme = ElevatedButton.styleFrom(
    elevation: 10.0,
    shadowColor: Colors.blue,
    textStyle: TextStyle(fontSize: 30.0, color: kLightTextColor, fontFamily: 'Comfortaa'),
    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    minimumSize: Size(250.0, 120.0),
  );

  @override
  Widget build(BuildContext context)
  {
    Size size = MediaQuery.of(context).size; //h&w of phone screen

    return Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: GestureDetector(
            onTap: () {
              //_controller.forward(); // start the animation
              updateState();

              Timer(Duration(milliseconds: _animationTime), () { //wait for lid
                updateState2();
              });

              Timer(Duration(milliseconds: _animationTime+1200), () { //wait for popsicles
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeScreen2())
                );
                updateState3();
              });

            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds: _animationPopsicle),
                  height: 100.0,
                  width: 20.0,
                  margin: EdgeInsets.only(bottom: _popsicleOffset, left:40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Color(0xffd4bda1)
                  ),
                ),

                AnimatedContainer(
                  duration: Duration(milliseconds: _animationPopsicle),
                  height: 100.0,
                  width: 20.0,
                  margin: EdgeInsets.only(bottom: _popsicleOffset, right: 40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Color(0xffd4bda1)
                  ),
                ),

                Container(
                  height: 200.0,
                  width: 200.0,
                  //margin: EdgeInsets.only(top: 18.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      //border: Border.all(color: Colors.black),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xefe3e3e3),
                            const Color(0xef454545)
                          ]
                      )
                  ),
                ),

                Container( // the lip
                  height: 30.0,
                  width: 130.0,
                  color: const Color(0xefe3e3e3),
                  margin: EdgeInsets.only(bottom: 200.0),
                ),

                AnimatedContainer( // the lid
                  duration: Duration(milliseconds: 300),
                  height: 40.0,
                  width: 140.0,
                  color: _lidColor,
                  margin: EdgeInsets.only(bottom: _lidOffset),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 100.0, bottom: 130.0),
                  child: Icon(
                    Icons.auto_awesome,
                    size: 70.0,
                    color: Colors.white70,
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}