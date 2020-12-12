import 'dart:math';

import 'package:best_dates/Objects/restaurant.dart';
import 'package:best_dates/Objects/restaurantarguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:best_dates/constants.dart';

class RestaurantScreen2 extends StatelessWidget
{
  static const routeName = '/restaurant2';

  String defaultImage =
      "https://thumbs.dreamstime.com/b/healthy-heart-super-food-healthy-heart-super-food-concept-to-promote-good-health-superfoods-pulses-seeds-fruit-vegetables-112354359.jpg";

  @override
  Widget build(BuildContext context) {
    final RestaurantArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(args, context),
    );
  }

  String _convertPriceRange(int priceLevel)
  {
    switch(priceLevel)
    {
      case 1: return "\$1 - \$8";
      case 2: return "\$8 - \$13";
      case 3: return "\$13 - \$18";
      case 4: return "\$18+";
      default: return "price range n/a";
    }
  }

  Widget _buildBody(RestaurantArguments args, BuildContext context)
  {
    // get a random result
    int length = args.restaurants.length;
    Random random = new Random();
    int randomIndex = random.nextInt(length);
    Restaurant restaurant = args.restaurants[randomIndex];

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: kSpacingAmount,
            width: kSpacingAmount,
          ),

          Text(
            restaurant.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
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
                image: NetworkImage(restaurant.imageURL == null ?
                defaultImage : restaurant.imageURL),
              )
            ),
          ),
          SizedBox(
            height: kSpacingAmount,
            width: kSpacingAmount,
          ),

          Text("Price Range: " + _convertPriceRange(restaurant.priceRange)),
          SizedBox(
            height: kGapHeight,
            width: kGapWidth,
          ),

          Text("Food Type: " + restaurant.restaurantType),
          SizedBox(
            height: kGapHeight,
            width: kGapWidth,
          ),

          // WEBSITE SECTION
          InkWell(
            child: Text(
              restaurant.websiteLink == null ? "No website available." : restaurant.websiteLink,
              style: TextStyle(
                color: restaurant.websiteLink == null ? kDarkTextColor : kPrimaryColor
              )
            ),
            onTap: ()
            {
              if (restaurant.websiteLink != null)
                launch(restaurant.websiteLink);
            },
          ),
          SizedBox(
            height: kGapHeight,
            width: kGapWidth,
          ),

          //https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget


          // ADDRESS SECTION
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(restaurant.address == null ? "Go and google the closest location" : restaurant.address),
              // IconButton(
              //   icon: Icon(
              //       Icons.copy
              //   ),
              //   onPressed: ()
              //   {
              //     //Clipboard.setData(new ClipboardData(text: restaurant.address == null ? "Why did you copy this??" : restaurant.address));
              //   },
              // ),
            ]
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


  void pressed(BuildContext context, RestaurantArguments args, int randomIndex, int length)
  {
    if (length == 1)
    {
      Navigator.pop(context);
    }
    else
    {
      args.restaurants.removeAt(randomIndex);
      Navigator.of(context).pushReplacementNamed(routeName, arguments: args);
    }

    //Navigator.pushReplacementNamed(context, routeName, {args})
    /*
    Navigator.pushNamed(
      context,
      RestaurantScreen2.routeName,
      arguments: args,
    );

     */
  }

}