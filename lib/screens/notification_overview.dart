import 'package:flutter/material.dart';

//Controller
import '../Controller/api_handler.dart';

//Widget
import '../Widget/notification_list_item.dart';

class NotificationOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notification Overview'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding:
                EdgeInsets.only(left: 0.0, top: 20.0, bottom: 0.0, right: 0.0),
            color: Colors.lightBlue,
            height: 50.0,
            width: double.infinity,
            child: Text(
              'All notifications are shown down here',
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
            child: Text('Get all notifications'),
            onPressed: () => {ApiHandler().getAllNotifications()},
          ),
          NotificationListItem(),
        ],
      ),
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
