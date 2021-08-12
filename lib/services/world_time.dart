import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icaon
  late String url; // location url for API end point

  void getTime() async {
    //make response
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);

    //get data from data
    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1,3);

    //convert normal time
    //create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);


  }


}