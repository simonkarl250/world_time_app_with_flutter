import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String flag;
  late String time;
  late String t_url;
  late bool  isDayTime;

  WorldTime({required this.location, required this.flag, required this.t_url});


  Future<void> getTime() async {

    try{
      // This example uses the Google Books API to search for books about http.
      // https://developers.google.com/books/docs/overview,{'q': '{http}'}
      //https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam
      var url = Uri.https('worldtimeapi.org', '/api/timezone/$t_url');

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        //print(jsonResponse);
        String datetime = jsonResponse['datetime'];
        String offset = (jsonResponse['utc_offset']).substring(1,3);

        DateTime now =DateTime.parse(datetime);

        now = now.add(Duration(hours: int.parse(offset)));

        isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

        time = DateFormat.jm().format(now);


      } else {
        print('Request failed with status: ${response.statusCode}.');
      }

    } catch(e){
      print('Error $e');

      time = "Network Err";
    }



  }


}
