import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Map data = {};

  @override
  Widget build(BuildContext context) {
    try {
      data = data.isNotEmpty? data : ModalRoute.of(context)?.settings.arguments as Map;
    }
    catch (e) {
      data = data;
    }
    //set background image
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color? bgcolor = data['isDaytime'] ? Colors.blue[600] : Colors.blue[900];
    Color? chColor = data['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150.0, 0, 0),
            child: Column(
              children: <Widget>[


                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 40.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: chColor,

                      ),
                    ),
                    IconButton(onPressed: () async {
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'time': result['time'],
                         'location' : result['location'],
                         'isDaytime' : result['isDaytime'],
                         'flag': result['flag']
                       };
                     });
                    },
                      icon: Icon(
                          Icons.edit_location,
                          color: chColor),
                      iconSize: 20.0,
                    ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 50.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    color: chColor,
                  ),
                )],
            ),
          ),
        ),
      )
    );

  }
}
