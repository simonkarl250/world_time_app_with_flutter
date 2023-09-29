import 'package:flutter/material.dart';
import 'package:world_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

 // String time = 'loading';

 void setupWorldTime() async {
   WorldTime instance = new  WorldTime(location: 'Kenya',flag: 'kenya.jpg',t_url: 'Africa/Nairobi');

   await instance.getTime();

   Navigator.pushReplacementNamed(context, '/home',arguments:{
     'location' : instance.location,
     'time' : instance.time,
     'flag': instance.flag,
     'isDayTime' :instance.isDayTime,
   });

   // print(instance.time);
   //
   // setState(() {
   //   time = instance.time;
   // });


 }


  @override
  void initState() {

    super.initState();
    setupWorldTime();

  }





  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Colors.blue,
      body: Center(
        child:SpinKitSpinningLines(
            color: Colors.white,
            size: 80.0,
          ),

      )
    );
  }
}
