import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const _androidChannel = AndroidNotificationChannel(
    'booking_channel',
    'Booking Notifications',
    description: 'Booking updates and alerts',
    importance: Importance.max,
  );

  static const _reminderChannel = AndroidNotificationChannel(
    'reminder_channel',
    'Reminder Notifications',
    description: 'Periodic reminders from Al-Mekhtar',
    importance: Importance.defaultImportance,
  );

  /// Must be called once in [initializeApp] before [runApp].
  static Future<void> init() async {
    tz.initializeTimeZones();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const windowsInit = WindowsInitializationSettings(
      appName: 'Al-Mekhtar',
      appUserModelId: 'com.mabeet.almekhtar',
      guid: 'a8098c1a-f86e-11da-bd1a-00112444be1e',
    );

    const settings = InitializationSettings(
      android: androidInit,
      windows: windowsInit,
    );

    await _plugin.initialize(settings);

    // Create notification channels on Android
    if (Platform.isAndroid) {
      final androidPlugin =
          _plugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await androidPlugin?.createNotificationChannel(_androidChannel);
      await androidPlugin?.createNotificationChannel(_reminderChannel);
    }
  }

  /// Show an immediate native notification (used when opening the page).
  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'booking_channel',
      'Booking Notifications',
      channelDescription: 'Booking updates and alerts',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
    );

    const windowsDetails = WindowsNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      windows: windowsDetails,
    );

    await _plugin.show(id, title, body, details);
  }

  /// Schedule a daily notification at [hour]:00 (local time) with [id].
  static Future<void> _scheduleDailyAt({
    required int id,
    required int hour,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'reminder_channel',
      'Reminder Notifications',
      channelDescription: 'Periodic reminders from Al-Mekhtar',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );

    const windowsDetails = WindowsNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      windows: windowsDetails,
    );

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
    );

    // If that time has already passed today, push to tomorrow.
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _plugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  /// Call once at startup to schedule the 1 AM and 1 PM reminders.
  static Future<void> scheduleRepeatingNotifications({
    required String title,
    required String body,
  }) async {
    // Cancel any previously scheduled reminders before re-scheduling.
    await _plugin.cancel(100);
    await _plugin.cancel(101);

    await _scheduleDailyAt(id: 100, hour: 1, title: title, body: body);
    await _scheduleDailyAt(id: 101, hour: 13, title: title, body: body);
  }
}
