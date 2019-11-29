import 'package:flutter/material.dart';

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
          SingleChildScrollView(
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }
}
