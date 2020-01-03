import 'package:flutter/material.dart';

class PriorityIcon extends StatelessWidget {
  String priority;

  PriorityIcon(this.priority);

  Color _priorityColor;

  getPriorityColor() {

    if (priority == 'High') {
      _priorityColor = Colors.deepOrange[900];
    } else if (priority == 'Medium') {
      _priorityColor = Colors.amber;
    } else if (priority == 'Low') {
      _priorityColor = Colors.limeAccent[400];
    } else {
      _priorityColor = Colors.grey;
    }
    return _priorityColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.warning,
        color: getPriorityColor(),
      ),
    );
  }
}
