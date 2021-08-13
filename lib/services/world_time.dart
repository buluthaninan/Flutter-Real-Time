import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';


class WorldTime {
   String location; // location name for the UI
   String time; // the time in that location
   String flag; // url to an asset flag icaon
   String url; // location url for API end point

  WorldTime({ this.location,  this.flag,  this.url});


  Future<void> getTime() async {

    try{
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

      // set time to string
      time = DateFormat.jm().format(now);
    }

    catch(e) {
      print("Caught an error: $e");
      time = "Couldn't get the time";
    }






  }


}

