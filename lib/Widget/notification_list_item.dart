import 'package:flutter/material.dart';

class NotificationListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.deepPurple,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Hello Rowena',
            style: TextStyle(color: Colors.deepOrange),
          )
        ],
      ),
    );
  }
}
