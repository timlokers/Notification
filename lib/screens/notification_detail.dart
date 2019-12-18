import 'package:flutter/material.dart';

//Widget
import '../Widget/notification_detail_stepper.dart';

class NotificationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notification Detail'),
      ),
      body: Container(
        child: NotificationDetail(),
      ),
    );
  }
}
