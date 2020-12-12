import 'dart:io';

import 'package:best_dates/Objects/activity.dart';
import 'package:best_dates/Objects/restaurant.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DateDAO
{
  static final String _databaseName = "DateDatabase.db";
  //static final _databaseVersion = 1;

  static final table = "Restaurants";
  static final activityTable = "Activities";

  final String activityDescription = "Description is coming!";

  //What columns we want info from
  /*
  static final columnName = "RestaurantName";
  static final columnPrice = "Price";
  static final columnType = "Type";
  static final columnAddress = "Address";
  static final columnWebsite = "Website";
  static final columnHasBrunch = "BrunchOptions";
  static final columnImageURL = "ImageURL";
*/

  // make this a singleton class
  DateDAO._privateConstructor();
  static final DateDAO instance = DateDAO._privateConstructor();


  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async
  {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }


  // this opens the database (and creates it if it doesn't exist)
  //returns a Database object
  //TODO: later, relearn how to do this better
  _initDatabase() async
  {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "app.v1.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e.toString());
      }

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
      print("Database created successfully");
    }
    else {
      print("Opening existing database");
    }

    // open the database
    return await openDatabase(path, version: 1, readOnly: false);
  }


  //preconditions: set is NOT null
  //we need this as a string for the SQL SELECT statement
  String convertFoodSetToString(Set<String> set)
  {
    String str = "";

    if (set != null && set.isNotEmpty)
    {
      print("set is not null");
      set.forEach((element)
      {
        str = str + "'" + element + "', "; //TODO: there's got to be a better way to cut this off early
      });
    }

    if (str != null && str.length >= 2)
    {
      str = str.substring(0, str.length - 2);
    }

    print(str);
    return str;
  }


  //preconditions: set is NOT null
  String convertPriceSetToString(Set<int> set)
  {
    String str = "";
    print(set);

    if (set != null && set.isNotEmpty)
    {
      set.forEach((element)
      {
        str = str + element.toString() + ", "; //TODO: there's got to be a better way to cut this off early
      });
    }

    if (str != null && str.length >= 2)
    {
      str = str.substring(0, str.length - 2);
    }
    print(str);
    return str;
  }


  //Future<Restaurant>
  Future<List<Restaurant>> queryRestaurants(Set<int> _selectedPriceRanges, Set<String> _selectedFoods) async
  {
    print("starting query\n");
    // get a reference to the database
    Database db = await DateDAO.instance.database;
    List<Map> results;

    //did they not select any options? Then grab a random restaurant.
    if ((_selectedPriceRanges == null && _selectedFoods == null) ||
        (_selectedPriceRanges.isEmpty && _selectedFoods.isEmpty))
    {
      results = await db.rawQuery("SELECT * FROM $table ORDER BY RANDOM() LIMIT 1"); //TODO: improve this for this and activity
    }
    //did they pick something? Then use that.
    else
    {
      if ((_selectedPriceRanges != null || _selectedPriceRanges.isNotEmpty) &&
          (_selectedFoods == null || _selectedFoods.isEmpty))
      {
        String meme2 = convertPriceSetToString(_selectedPriceRanges);
        results = await db.rawQuery("SELECT * FROM $table WHERE Price IN ($meme2)");
      }
      else if ((_selectedPriceRanges == null || _selectedPriceRanges.isEmpty) &&
          (_selectedFoods != null || _selectedFoods.isNotEmpty))
      {
        String meme = convertFoodSetToString(_selectedFoods);
        results = await db.rawQuery("SELECT * FROM $table WHERE Type IN ($meme)");
      }
      else //both
      {
        String meme = convertFoodSetToString(_selectedFoods);
        List<Map> typeResults = await db.rawQuery("SELECT * FROM $table WHERE Type IN ($meme)");

        String meme2 = convertPriceSetToString(_selectedPriceRanges);
        List<Map> priceResults = await db.rawQuery("SELECT * FROM $table WHERE Price IN ($meme2)");


        results = new List<Map>();
        for (int i = 0; i < typeResults.length; i++)
        {
          print(typeResults[i]['RestaurantName']);
          for (int j = 0; j < priceResults.length; j++)
          {
            if (typeResults[i]['RestaurantName'] == priceResults[j]['RestaurantName'])
            {
              results.add(typeResults[i]);
              print(priceResults[j]['RestaurantName']);
              break;
            }
          }
        }
      }
    }

    //TODO: check if we got any results or not!!!!!!!!!
    if (results == null || results.isEmpty)
    {
      return null;
    }

/*
    return Restaurant( myResult['RestaurantName'], myResult['Price'],
        myResult['Type'], myResult['Address'], myResult['Website'],
        myResult['ImageURL'], myResult['BrunchOptions']);

 */
    return List.generate(results.length, (i)
    {
      return Restaurant( results[i]['RestaurantName'], results[i]['Price'], results[i]['Type'], results[i]['Address'], results[i]['Website'], results[i]['ImageURL'], results[i]['BrunchOptions']);
    });
  }





  String getActivityImage(type)
  {
    switch(type)
    {
      case "Chill":
        return "https://image.freepik.com/free-photo/heart-shape-from-two-hand-with-sunrise-background_1150-9249.jpg";
      case "Cinema":
        return "https://deadline.com/wp-content/uploads/2016/06/movie-theater1.jpg?crop=607px%2C1005px%2C2808px%2C1574px&resize=681%2C383";
      case "Exhibit":
        return "https://images.pexels.com/photos/20967/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500";
      case "Fun":
        return "https://previews.123rf.com/images/rez_art/rez_art1702/rez_art170200130/75296579-couple-on-date-eating-pickles-and-drinking-beer-having-fun.jpg";
      case "Game":
        return "https://i.pcmag.com/imagery/lineups/06PiprC5eiYhlpaNS6N0sbP-1.1569492872.fit_lim.size_1200x630.jpg";
      case "Hike":
        return "https://media.istockphoto.com/videos/young-woman-running-up-the-rocky-mountain-video-id457073714?s=640x640";
      case "Make":
        return "https://images.pexels.com/photos/301703/pexels-photo-301703.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
      case "Music Dance":
       return "https://image.shutterstock.com/image-photo/studio-shot-overjoyed-teenage-couple-260nw-1568912452.jpg";
      case "Outdoor sports":
        return "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Ski_Famille_-_Family_Ski_Holidays.jpg/1200px-Ski_Famille_-_Family_Ski_Holidays.jpg";
      case "Performance":
        return "https://www.bsu.edu/-/media/www/departmentalcontent/musicschool/images/ensembles/bsso_12-8-15_t.jpg?h=601&w=1500&hash=B0A82EBD55AB2FB5183180D2D7B2170EF0D66C78&la=en";
      case "Service":
        return "https://www.vicnews.com/wp-content/uploads/2020/06/21877933_web1_VolunteerHandsMetro.jpg";
      case "Sports":
        return "https://media.istockphoto.com/photos/various-sport-equipments-on-grass-picture-id949190756?k=6&m=949190756&s=612x612&w=0&h=dNek5l5xc68G0gCZv-fe0vHP8kjDpAYFrRnSPh8iLyc=";
      default:
        return "";
    }
  }



  Future<List<DateActivity>> queryActivities(Set<String> _selectedFoods) async
  {
    print("starting query\n");
    // get a reference to the database
    Database db = await DateDAO.instance.database;
    List<Map> results;

    //did they not select any options? Then grab a random restaurant.
    if (_selectedFoods == null || _selectedFoods.isEmpty)
    {
      results = await db.rawQuery("SELECT * FROM $activityTable ORDER BY RANDOM() LIMIT 1");
    }
    //did they pick something? Then use that.
    else
    {
      print(_selectedFoods);
      String meme = convertFoodSetToString(_selectedFoods);

      // raw query
      results = await db.rawQuery("SELECT * FROM $activityTable WHERE ActivityType IN ($meme)"); //todo: Broken!!!!!
    }

    //TODO: check if we got any results or not!!!!!!!!!


    // get a random result
    // print(results);
    // int length = results.length;
    // Random random = new Random();
    // int randomIndex = random.nextInt(length);
    // Map myResult = results[randomIndex];




    return List.generate(results.length, (i)
    {
      return DateActivity( results[i]['ActivityName'], results[i]['ActivityType'],
          (results[i]['Description'] == null ? activityDescription : results[i]['Description']),
          getActivityImage(results[i]['ActivityType']));
    });
  }

}



/*
Setting up a db helper
  //https://stackoverflow.com/questions/63413472/flutter-sqflite-asset-database
  //https://stackoverflow.com/questions/54223929/how-to-do-a-database-query-with-sqflite-in-flutter

 */