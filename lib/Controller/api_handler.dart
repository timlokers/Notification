import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'dart:async';

import 'package:notification/model/notification.dart';

class ApiHandler {

  //Get all notifications
  static const String _allNotifications =
      'https://tim-lokers.outsystemscloud.com/Notification_API/rest/Notification/GetAllNotifications';

  //Create a new notification
  static const String _createNotifications =
      'https://tim-lokers.outsystemscloud.com/Notification_API/rest/Notification/PostNotification';

  //Update a notification
  static const String _updateNotification =
      'https://tim-lokers.outsystemscloud.com/Notification_API/rest/Notification/UpdateNotification';

  //Delete a notification
  static const String _deleteNotification = 'https://tim-lokers.outsystemscloud.com/Notification_API/rest/Notification/DeleteNotification';

  Future<List<Notifications>> getAllNotifications() async {
    final response = await get(_allNotifications);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((notification) => new Notifications.fromJson(notification))
          .toList();
    } else {
      throw Exception('Something went wrong retrieving all the notifications');
    }
  }

  void createNotification(String id, String description, String priority,
      String timestamp) async {
    try {
      Map<String, String> notification = {
        'id': id,
        'description': description,
        'priority': priority,
        'timestamp': timestamp
      };
      final response = await post(_createNotifications, headers: notification);
      if (response.statusCode == 200 || response.statusCode >= 400) {}
    } catch (e) {
      throw e;
    }
  }

  void updateNotification(String id, String description,
      String priority, String timestamp) async {
    try {
      Map<String, String> notification = {
        'id': id,
        'description': description,
        'priority': priority,
        'timestamp': timestamp
      };
      final response = await put(_updateNotification, headers: notification);
      if(response.statusCode == 200 || response.statusCode >= 400){}
    }
    catch (e){
      throw e;
    }
  }

  void deleteNotification(String id) async{
    try{
      Map<String, String> notificationId = {
        'NotificationId' : id
      };
      final response = await delete(_deleteNotification, headers: notificationId);
      if(response.statusCode == 200 || response.statusCode >= 400){}
    }
    catch (e){
      throw e;
    }
  }
}
