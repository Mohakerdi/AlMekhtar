// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;

// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   /// INIT
//   static Future<void> init() async {
//     const AndroidInitializationSettings androidInit =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings settings = InitializationSettings(
//       android: androidInit,
//     );

//     // await _notificationsPlugin.initialize(settings);

//     tz.initializeTimeZones();
//   }

//   /// SHOW IN QUICK SETTINGS
//   static Future<void> showNotification({
//     required int id,
//     required String title,
//     required String body,
//   }) async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//           'booking_channel',
//           'Bookings Notifications',
//           channelDescription: 'Booking updates and alerts',
//           importance: Importance.max,
//           priority: Priority.high,
//           playSound: true,
//           enableVibration: true,
//         );

//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: androidDetails,
//     );

//     await _notificationsPlugin.show(id, title, body, notificationDetails);
//   }
// }
