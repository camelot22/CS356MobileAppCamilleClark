import 'package:best_dates/Database/DateDAO.dart';
import 'package:best_dates/Objects/activityarguments.dart';
import 'package:best_dates/Screens/loadingscreen2.dart';
import 'package:flutter/material.dart';
import 'package:best_dates/constants.dart';

class ActivityScreen1 extends StatefulWidget
{
  static const routeName = '/activity1';

  @override
  _ActivityScreen1State createState() => _ActivityScreen1State();

}



class _ActivityScreen1State extends State<ActivityScreen1>
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

  var _selectedFoods = Set<String>();


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: Text('Activity Filters'),
        ),
        body: _buildBody()
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

  Widget _buildBody()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              SizedBox(
                height: kGapHeight,
                width: kGapHeight,
              ),
            ]
        ),


        SizedBox(
            height: kSizedBoxHeight,
            width: kSizedBoxWidth,
            child: OutlinedButton(
              onPressed: () => _buttonPushed("Chill"),
              child: Text("Chill"),
              style: _selectedFoods.contains("Chill") ?
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
              onPressed: () => _buttonPushed("Cinema"),
              child: Text("Cinema"),
              style: _selectedFoods.contains("Cinema") ?
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
              onPressed: () => _buttonPushed("Exhibit"),
              child: Text("Exhibit"),
              style: _selectedFoods.contains("Exhibit") ?
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
              onPressed: () => _buttonPushed("Fun"),
              child: Text("Fun"),
              style: _selectedFoods.contains("Fun") ?
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
              onPressed: () => _buttonPushed("Game"),
              child: Text("Game"),
              style: _selectedFoods.contains("Game") ?
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
              onPressed: () => _buttonPushed("Hike"),
              child: Text("Hike"),
              style: _selectedFoods.contains("Hike") ?
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
              onPressed: () => _buttonPushed("Make"),
              child: Text("Make Something"),
              style: _selectedFoods.contains("Make") ?
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
              onPressed: () => _buttonPushed("Music Dance "),
              child: Text("Music & Dancing"),
              style: _selectedFoods.contains("Music Dance ") ?
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
              onPressed: () => _buttonPushed("Outdoor sports"),
              child: Text("Outdoor Sports"),
              style: _selectedFoods.contains("Outdoor sports") ?
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
              onPressed: () => _buttonPushed("Performance"),
              child: Text("Watch A Performance"),
              style: _selectedFoods.contains("Performance") ?
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
              onPressed: () => _buttonPushed("Service"),
              child: Text("Do Service"),
              style: _selectedFoods.contains("Service") ?
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
              onPressed: () => _buttonPushed("Sports"),
              child: Text("Play A Sport"),
              style: _selectedFoods.contains("Sports") ?
              selectedButtonStyle : outlinedButtonStyle,
            )
        ),
        SizedBox(
          height: kGapHeight,
          width: kGapWidth,
        ),

        ElevatedButton(
          onPressed: () => pressed(),
          child: Text("Generate Activities"),
        )
      ]
    );
  }

  void pressed() async
  {
    var db = DateDAO.instance;
    var activities = await db.queryActivities(_selectedFoods);

    //print('query all rows:');
    //allRows.forEach((row) => print(row));


    if (activities != null)
    {
      Navigator.pushNamed(
        context,
        ActivityLoadingScreen.routeName,
        arguments: ActivityArguments( _selectedFoods, activities),
      );
    }
    else
    {
      //TODO:make a toast appear saying "no results within your filters"
    }
  }

}