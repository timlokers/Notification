import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notification/model/notification.dart';

//API handler
import '../Controller/api_handler.dart';

//Widgets
import '../Widget/camera_detail.dart';

class NotificationDetailForm extends StatefulWidget {
  var notification = new Notifications();

  NotificationDetailForm(this.notification);

  @override
  _NotificationDetailFormState createState() => _NotificationDetailFormState();
}

class _NotificationDetailFormState extends State<NotificationDetailForm> {
  TextEditingController descriptionController = new TextEditingController();

  static final DateTime timestamp = new DateTime.now();
  String formatTimestamp =
  DateFormat('dd-MM-yyyy - hh:mm:ss').format(timestamp).toString();

  String dropdownValue = 'High';

  File _image;

  Future getImage() async {

  }

  @override
  void initState() {
    try {
      if (widget.notification != null) {
        formatTimestamp = widget.notification.timeStamp;
        descriptionController.text = widget.notification.description;
        dropdownValue = widget.notification.priority;
        super.initState();
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          Text(formatTimestamp),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new TextFormField(
              controller: descriptionController,
              decoration: new InputDecoration(
                hintText: 'Description',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['High', 'Medium', 'Low']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          CameraDetail(),
          widget.notification == null
              ? new RaisedButton(
            //create new notification
            onPressed: () async {
              ApiHandler().createNotification(
                  '',
                  descriptionController.text,
                  dropdownValue,
                  formatTimestamp);
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text(
              'Save new notification',
              style: TextStyle(color: Colors.deepOrange, fontSize: 20.0),
            ),
          )
              : new RaisedButton(
            //update existing notification
            onPressed: () async {
              ApiHandler().updateNotification(
                  widget.notification.id.toString(),
                  descriptionController.text,
                  dropdownValue,
                  formatTimestamp);
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text(
              'Update notification',
              style: TextStyle(color: Colors.deepOrange, fontSize: 20.0),
            ),
          ),
          widget.notification == null
              ? Container()
              : new RaisedButton.icon(
            onPressed: () async {
              ApiHandler()
                  .deleteNotification(widget.notification.id.toString());
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(
              Icons.delete,
              color: Colors.deepOrange,
            ),
            label: Text(''),
          ),
        ],
      ),
    );
  }
}
