import 'package:flutter/material.dart';

//import screens
import 'screens/notification_overview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent[200],
        fontFamily: 'Geo'
      ),
      home: NotificationOverview(),
    );
  }
}
