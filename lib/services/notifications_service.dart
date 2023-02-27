import 'package:arm_project/data/dataproviders/firebase_dataprovider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> getToken() async {
    await _firebaseMessaging.getToken().then((token) {
      FirebaseDataProvider().sendNotificationToken(token);
    });
  }

  void test() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}
