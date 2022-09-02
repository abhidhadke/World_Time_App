import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Choose_Location extends StatefulWidget {
  const Choose_Location({Key? key}) : super(key: key);




  @override
  State<Choose_Location> createState() => _choose_locationState();
}

class _choose_locationState extends State<Choose_Location>{

  List<WorldTime> locations = [
      WorldTime(url1: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
      WorldTime(url1: 'Asia/Dubai', location: 'Dubai', flag: 'dubai.png'),
      WorldTime(url1: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hk.png'),
      WorldTime(url1: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
      WorldTime(url1: 'Europe/Berlin', location: 'Berlin', flag: 'berlin.png'),
      WorldTime(url1: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
      WorldTime(url1: 'Asia/Seoul', location: 'Seoul', flag: 'sk.png'),

];

  void updateTime(index) async {

    WorldTime instance =    locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose your Location'),
        elevation: 0,
        centerTitle: true,

      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title:  Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  radius: 20.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
