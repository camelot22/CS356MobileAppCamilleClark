import 'package:best_dates/Database/DateDAO.dart';
import 'package:best_dates/Objects/restaurantarguments.dart';
import 'package:best_dates/Screens/loadingscreen.dart';
import 'package:best_dates/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RestaurantScreen1 extends StatefulWidget
{
  static const routeName = '/restaurant1';

  @override
  _RestaurantScreen1State createState() => _RestaurantScreen1State();

}



class _RestaurantScreen1State extends State<RestaurantScreen1>
{
  var selectedButtonStyle = OutlinedButton.styleFrom(
    primary: kBackgroundColor,
    shape: StadiumBorder(),
    backgroundColor: Colors.grey,
  );
  var outlinedButtonStyle = OutlinedButton.styleFrom(
    primary: kDarkTextColor,
    shape: StadiumBorder(),
    backgroundColor: null,
    side: BorderSide(width: .5, color: Colors.grey),
  );

  final selectedMoneyButtonStyle = OutlinedButton.styleFrom(
    primary: kBackgroundColor,
    shape: StadiumBorder(),
    backgroundColor: Colors.grey,
  );
  final outlinedMoneyButtonStyle = OutlinedButton.styleFrom(
    primary: kDarkTextColor,
    shape: StadiumBorder(),
    backgroundColor: null,
    side: BorderSide(width: .5, color: Colors.grey),
  );
  var elevatedButtonTheme = ElevatedButton.styleFrom(
    elevation: 10.0,
    shadowColor: Colors.blue,
    textStyle: TextStyle(fontSize: 30.0, color: kLightTextColor, fontFamily: 'Comfortaa'),
    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    minimumSize: Size(200.0, 50.0),
  );

  var _selectedPriceRanges = Set<int>();
  var _selectedFoods = Set<String>();




  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Filters'),
      ),
      body: _buildBody(context)
    );
  }


  void _buttonPushed(String type) {
    setState(() {
      //if the food is selected, remove it from the list. Make the button turn unfilled.
      //if the food isn't already selected, add it to the list. Make the button turn filled.
      if (_selectedFoods.contains(type)) {
        _selectedFoods.remove(type);
      } else {
        _selectedFoods.add(type);
      }
    });
  }

  void moneyButtonPushed(int level) {
    setState(() {
      if (_selectedPriceRanges.contains(level)) {
        _selectedPriceRanges.remove(level);
      } else {
        _selectedPriceRanges.add(level);
      }
    });
  }

  Widget _buildBody(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () => moneyButtonPushed(1),
              child: Text("\$1 - \$8"),
              style: _selectedPriceRanges.contains(1) ?
              selectedMoneyButtonStyle : outlinedMoneyButtonStyle,
            ),
            OutlinedButton(
              onPressed: () => moneyButtonPushed(2),
              child: Text("\$8 - \$13"),
              style: _selectedPriceRanges.contains(2) ?
              selectedMoneyButtonStyle : outlinedMoneyButtonStyle,
            ),
            OutlinedButton(
              onPressed: () => moneyButtonPushed(3),
              child: Text("\$13 - \$18"),
              style: _selectedPriceRanges.contains(3) ?
              selectedMoneyButtonStyle : outlinedMoneyButtonStyle,
            ),
            OutlinedButton(
              onPressed: () => moneyButtonPushed(4),
              child: Text("\$18+"),
              style: _selectedPriceRanges.contains(4) ?
              selectedMoneyButtonStyle : outlinedMoneyButtonStyle,
            ),
          ]
        ),
        SizedBox(
          height: kGapHeight,
          width: kGapWidth,
        ),

        SizedBox(
            height: kSizedBoxHeight,
            width: kSizedBoxWidth,
            child: OutlinedButton(
              onPressed: () => _buttonPushed("American"),
              child: Text("American"),
              style: _selectedFoods.contains("American") ?
              selectedButtonStyle : outlinedButtonStyle,
            )
        ),
        SizedBox(
          height: kGapHeight,
          width: kGapWidth,
        ),

        SizedBox(
            height: kSizedBoxHeight,
            width: kSizedBoxWidth,
            child: OutlinedButton(
              onPressed: () => _buttonPushed("Asian"),
              child: Text("Asian"),
              style: _selectedFoods.contains("Asian") ?
              selectedButtonStyle : outlinedButtonStyle,
            )
        ),
        SizedBox(
          height: kGapHeight,
          width: kGapWidth,
        ),

        SizedBox(
            height: kSizedBoxHeight,
            width: kSizedBoxWidth,
            child: OutlinedButton(
              onPressed: () => _buttonPushed("Hawaiian"),
              child: Text("Hawaiian"),
              style: _selectedFoods.contains("Hawaiian") ?
              selectedButtonStyle : outlinedButtonStyle,
            )
        ),
        SizedBox(
          height: kGapHeight,
          width: kGapWidth,
        ),

        SizedBox(
            height: kSizedBoxHeight,
            width: kSizedBoxWidth,
            child: OutlinedButton(
              onPressed: () => _buttonPushed("Indian"),
              child: Text("Indian"),
              style: _selectedFoods.contains("Indian") ?
              selectedButtonStyle : outlinedButtonStyle,
            )
        ),
        SizedBox(
          height: kGapHeight,
          width: kGapWidth,
        ),

        SizedBox(
            height: kSizedBoxHeight,
            width: kSizedBoxWidth,
            child: OutlinedButton(
              onPressed: () => _buttonPushed("Latin & South American"),
              child: Text("Latin & South American"),
              style: _selectedFoods.contains("Latin & South American") ?
              selectedButtonStyle : outlinedButtonStyle,
            )
        ),
        SizedBox(
          height: kGapHeight,
          width: kGapWidth,
        ),

        SizedBox(
            height: kSizedBoxHeight,
            width: kSizedBoxWidth,
            child: OutlinedButton(
              onPressed: () => _buttonPushed("Mediterranean"),
              child: Text("Mediterranean"),
              style: _selectedFoods.contains("Mediterranean") ?
              selectedButtonStyle : outlinedButtonStyle,
            )
        ),
        SizedBox(
          height: kGapHeight,
          width: kGapWidth,
        ),

        SizedBox(
            height: kSizedBoxHeight,
            width: kSizedBoxWidth,
            child: OutlinedButton(
              onPressed: () => _buttonPushed("Pizza"),
              child: Text("Pizza"),
              style: _selectedFoods.contains("Pizza") ?
              selectedButtonStyle : outlinedButtonStyle,
            )
        ),
        SizedBox(
          height: kGapHeight,
          width: kGapWidth,
        ),

        SizedBox(
            height: kSizedBoxHeight,
            width: kSizedBoxWidth,
            child: OutlinedButton(
              onPressed: () => _buttonPushed("Sweets"),
              child: Text("Sweets"),
              style: _selectedFoods.contains("Sweets") ?
              selectedButtonStyle : outlinedButtonStyle,
            )
        ),
        SizedBox(
          height: kGapHeight+20,
          width: kGapWidth,
        ),

        ElevatedButton(
            onPressed: () => pressed(context),
            child: Text(
                "Get A Restaurant",
              //textAlign: TextAlign.center,
              style: TextStyle(color: kLightTextColor, fontWeight: FontWeight.w700
              )
            ),
            style: elevatedButtonTheme,
        )
      ]
    );
  }




// https://stackoverflow.com/questions/12649573/how-do-you-build-a-singleton-in-dart

  void pressed(BuildContext context) async
  {
    var db = DateDAO.instance;
    var restaurantsList = await db.queryRestaurants(_selectedPriceRanges, _selectedFoods);
    //print('query all rows:');
    //allRows.forEach((row) => print(row));


    if (restaurantsList != null)
    {
      // Navigator.pushNamed(
      //   context,
      //   RestaurantScreen2.routeName,
      //   arguments: RestaurantArguments(null, null, restaurantsList),
      // );
      Navigator.pushNamed(
        context,
        RestaurantLoadingScreen.routeName,
        arguments: RestaurantArguments(null, null, restaurantsList),
      );
    }
    else
    {
      //TODO:make a toast appear saying "no results within your filters"
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("Sending Message"),
      // ));
    }
  }

}