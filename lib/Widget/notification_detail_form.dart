import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//API handler
import '../Controller/api_handler.dart';

class NotificationDetailForm extends StatefulWidget {
  @override
  _NotificationDetailFormState createState() => _NotificationDetailFormState();
}

class _NotificationDetailFormState extends State<NotificationDetailForm> {

  TextEditingController descriptionController = new TextEditingController();

  static final DateTime timestamp = new DateTime.now();
  String formatTimestamp = DateFormat('dd-MM-yyyy - hh:mm:ss').format(timestamp).toString();

  String dropdownValue = 'High';

  @override
  Widget build(BuildContext context) {
    final notificationId = ModalRoute.of(context).settings.arguments;
    print(notificationId);
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
          new RaisedButton(
            onPressed: () async {
              ApiHandler().createNotification('', descriptionController.text, dropdownValue, formatTimestamp);
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text(
              'Save new notification',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
