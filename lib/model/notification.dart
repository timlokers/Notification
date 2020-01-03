class Notifications {
  int id;
  String description;
  String priority;
  String timeStamp;

  Notifications({this.id, this.description, this.priority, this.timeStamp});

  factory Notifications.fromJson(Map json) {
    return Notifications(
      id: json['Id'],
      description: json['Description'],
      priority: json['Priority'],
      timeStamp: json['Timestamp'],
    );
  }
}
