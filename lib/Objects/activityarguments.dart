import 'package:best_dates/Objects/activity.dart';

class ActivityArguments {
  var selectedFoods = Set<String>();
  DateActivity activity;

  ActivityArguments(this.selectedFoods, this.activity);
}