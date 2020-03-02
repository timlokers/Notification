import 'package:flutter/material.dart';
import '../model/notification.dart';
import '../Small_Widgets/priority_icon.dart';
import '../screens/notification_detail.dart';

class NotificationListItem extends StatelessWidget {
  Notifications notification = new Notifications();

  NotificationListItem(this.notification);

  void selectNotification(BuildContext context){
    Navigator.pushNamed(context, NotificationDetail.routeName, arguments: notification);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectNotification(context),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(width: 1, color: Colors.grey),
          bottom: BorderSide(width: 1, color: Colors.grey),
        )),
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              height: 75,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Row(
                children: <Widget>[
                  PriorityIcon(notification.priority),
                ],
              ),
              color: Colors.grey[300],
            ),
            Container(
              height: 75,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      notification.description,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 25,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: notification.timeStamp == null
                        ? Text(
                            'No timestamp',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        : Text(
                            notification.timeStamp.toString(),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
