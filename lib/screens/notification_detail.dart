import 'package:flutter/material.dart';

//Widget
//import '../Widget/notification_detail_stepper.dart';
import '../Widget/notification_detail_form.dart';

class NotificationDetail extends StatelessWidget {
  static const routeName = '/notification_detail';

  @override
  Widget build(BuildContext context) {
    final notification = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notification Detail'),
      ),
      body: Container(
        child: NotificationDetailForm(notification),
      ),
    );
  }
}
