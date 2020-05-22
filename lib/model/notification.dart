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

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['description'] = description;
    map['priority'] = priority;
    map['timestamp'] = timeStamp;
  }

  Notifications.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.description = map['description'];
    this.priority = map['description'];
    this.timeStamp = map['timestamp'];
  }

}


