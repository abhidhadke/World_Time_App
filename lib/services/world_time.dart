import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';



class WorldTime{

  late String location;//location name for the UI
  late String time; //the time in that location
  late String flag; //url to flag asset icon
  late String url1; // part of url to update
  late bool isDaytime; //true or false




  Future<dynamic> getTime() async {
    Future.delayed(const Duration(seconds: 15), () {});
    try{
  var url = Uri.parse( "http://worldtimeapi.org/api/timezone/$url1" );
  var response = await http.get(url);
  Map data = jsonDecode(response.body);


  String datetime = data['utc_datetime'];
  String offset1 = data['utc_offset'].substring(1,3);
  String offset2 = data['utc_offset'].substring(4,6);
  DateTime dtime = DateTime.parse(datetime);
  dtime = dtime.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

  isDaytime = dtime.hour > 6 && dtime.hour < 20;
  time = DateFormat.jm().format(dtime);

    }
  catch(e){
      print('Caught error $e');
      time = 'Could not get time';
  }


  }
  WorldTime({required this.location, required this.flag, required this.url1});
}
