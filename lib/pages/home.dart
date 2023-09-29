import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {





    data = data.isNotEmpty ? data :  ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    String bkpng = data['isDayTime'] ? 'day.png': 'night.png';
    Color bkgColor = data['isDayTime'] ? Colors.blue : Colors.grey;

    print(data);

    return  Scaffold(
      backgroundColor: bkgColor,
      body: SafeArea(

          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bkpng'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        label: Text(
                              'edit location',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                            ),
                        onPressed: () async {
                         dynamic results = await Navigator.pushNamed(context, '/location');
                         setState(() {
                           data = {
                             'location' : results['location'],
                             'time' : results['time'],
                             'flag': results['flag'],
                             'isDayTime' :results['isDayTime'],
                           };
                         });
                        },
                        icon: Icon(Icons.edit_location),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 66.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                ],
      ),
            ),
          )),
    );
  }
}

