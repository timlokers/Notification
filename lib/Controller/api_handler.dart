import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'dart:async';

import 'package:notification/model/notification.dart';

class ApiHandler {
  static const String _allNotifications =
      'https://tim-lokers.outsystemscloud.com/Notification_API/rest/Notification/GetAllNotifications';

  Map<String, String> postHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  Future<List<Notifications>> getAllNotifications() async {
    final response = await get(_allNotifications);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((notification) => new Notifications.fromJson(notification)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  void createNotification(
      String id, String description, String priority, String timestamp) async {
    final String _createNotifications =
        'https://tim-lokers.outsystemscloud.com/Notification_API/rest/Notification/PostNotification';
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
}
