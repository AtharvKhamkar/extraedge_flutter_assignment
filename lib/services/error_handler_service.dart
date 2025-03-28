import 'package:flutter/material.dart';

class ErrorHandlerService {
  static void handleError(dynamic error, String context, {StackTrace? stackTrace}) {

    String errorMessage = 'Error in $context: $error';
    
    String timestamp = DateTime.now().toIso8601String();
    debugPrint('[$timestamp] $errorMessage');
    
    if (stackTrace != null) {
      debugPrint('Stack Trace: $stackTrace');
    }
  }
}