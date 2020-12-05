class DateActivity
{
  final String name; //get from db
  final String type; //get from db
  final String description; //get from db
  String imageURL; //get from whoever calls this


  DateActivity(this.name, this.type, this.description, this.imageURL);
}