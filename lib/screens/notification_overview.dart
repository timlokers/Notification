import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

//Controller
import '../Controller/api_handler.dart';
import '../Controller/database_helper.dart';

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

  DatabaseHelper helper = DatabaseHelper();

  List<Notifications> notificationList;

  @override
  void initState() {
    final Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((notifications){
      Future<List<Notifications>> notificationListFuture = helper.getNotificationsList();
      notificationListFuture.then((notificationList){
        setState(() {
          this.notificationList = notificationList;
        });
      });
    });

    ApiHandler().getAllNotifications().then((response) {
      setState(() {
        notificationList = response;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notification Overview ' + helper.getCount().toString()),
      ),
      body:
          ListView.builder(
              itemCount: notificationList.length,
              itemBuilder: (context, index) {
                return NotificationListItem(
                    notificationList[index]); //Single list item widget
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
