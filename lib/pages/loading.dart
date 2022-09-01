import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart ';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

String time = 'Loading';

class _LoadingState extends State<Loading> {

 void SetWorldTime() async {
try {
  WorldTime india = WorldTime(
      location: 'India', flag: 'india.png', url1: 'Asia/Kolkata');
  await india.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': india.location,
    'flag': india.flag,
    'time': india.time
  });
}

catch(e){
  print('Error caught $e');
}
}


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SetWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60.0),
        child: Text(time),
      )
    );
  }
}
