import 'package:flutter/material.dart';

class Choose_Location extends StatefulWidget {
  const Choose_Location({Key? key}) : super(key: key);




  @override
  State<Choose_Location> createState() => _choose_locationState();
}

class _choose_locationState extends State<Choose_Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose your Location'),
        elevation: 0,
        centerTitle: true,

      ),
      body: Text('Choose a location'),
    );
  }
}
