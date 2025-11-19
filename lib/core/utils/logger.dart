import 'package:flutter/foundation.dart';

/// Simple logger utility for the application
class AppLogger {
  static void log(String message, {String? tag}) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag] ' : '';
      print('$prefix$message');
    }
  }

  static void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag] ' : '';
      print('$prefix ERROR: $message');
      if (error != null) {
        print('$prefix Error object: $error');
      }
      if (stackTrace != null) {
        print('$prefix Stack trace: $stackTrace');
      }
    }
  }
}
