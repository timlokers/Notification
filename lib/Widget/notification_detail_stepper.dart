import 'package:flutter/material.dart';

class NotificationDetailStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stepper(steps: [
        Step(
          title: Text('Yeah'),
          content: Text('Yeah just yeah!'),
        ),
        Step(
          title: Text('Fuck yeah'),
          content: Text('Yeah just fuck yeah!'),
        ),
        Step(
          title: Text('YYYYEEAAAAAAHHHHH'),
          content: Text('fuck, I shit my pants...'),
        )
      ]),
    );
  }
}
