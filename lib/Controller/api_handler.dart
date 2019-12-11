import 'package:http/http.dart' as http;

class ApiHandler {

  String allNotifications = 'https://tim-lokers.outsystemscloud.com/Notification_API/rest/Notification/GetAllNotifications';

  void getAllNotifications() {
    http.get(allNotifications);
  }
}
