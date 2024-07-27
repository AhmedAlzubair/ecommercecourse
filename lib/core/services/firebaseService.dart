import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService{
    static final FirebaseAuth auth = FirebaseAuth.instance;
    sendNotfiy(String title, String body, String id) async {
    String serverTok =
        "";
    await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Authorization': 'key=$serverTok ',
          'Content-Type': 'application/json',
          'From':'' ,
        },
        body: jsonEncode(<String, dynamic>{
          'notification': <String, dynamic>{
            "body": body,
            "title": title,
          },
          'priority': 'high',
          // "data": <String, dynamic>{
          //   "click_action": "FLUTTER_NOTIFICATION_CLICK",
          //   "sound": "default",
          //   'id': id.toString(),
          //   'type': type
          // },
          //'to': await FirebaseMessaging.instance.getToken()
          'to': id.toString()
        }));
  }
}