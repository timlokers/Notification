import 'package:flutter/material.dart';

//Controller
import '../Controller/api_handler.dart';

//Widget
import '../Widget/notification_list_item.dart';

//Model
import '../model/notification.dart';

class NotificationOverview extends StatefulWidget {
  static const routeName = '/';

  @override
  _NotificationOverviewState createState() => _NotificationOverviewState();
}

class _NotificationOverviewState extends State<NotificationOverview> {
  var notifications = new List<Notifications>();

  @override
  void initState() {
    super.initState();
    ApiHandler().getAllNotifications().then((response) {
      setState(() {
        notifications = response;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notification Overview'),
      ),
      body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationListItem(
                notifications[index]); //Single list item widget
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/notification_detail');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
