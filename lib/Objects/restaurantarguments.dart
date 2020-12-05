import 'package:best_dates/Objects/restaurant.dart';

class RestaurantArguments {
  var restaurantPriceRanges = Set();
  var selectedFoods = Set<String>();
  List<Restaurant> restaurants;

  RestaurantArguments(
      this.restaurantPriceRanges, this.selectedFoods, this.restaurants);


}