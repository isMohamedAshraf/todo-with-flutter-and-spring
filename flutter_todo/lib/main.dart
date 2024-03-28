import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/src/app.dart';
import 'package:flutter_todo/src/exceptions/async_error_logger.dart';
import 'package:flutter_todo/src/exceptions/error_logger.dart';
import 'package:flutter_todo/src/localization/string_hardcoded.dart';

// Entry point for the application, sets up ProviderContainer, error handling, and runs the main App.
void main() {
  final container = ProviderContainer(
    overrides: [],
    observers: [AsyncErrorLogger()],
  );
  final errorLogger = container.read(errorLoggerProvider);
  registerErrorHandlers(errorLogger);
  runApp(UncontrolledProviderScope(
    container: container,
    child: const App(),
  ));
}

/// Registers error handlers for the application.
///
/// This function takes an [ErrorLogger] object as a parameter and sets up
/// error handlers for uncaught exceptions, errors from the underlying platform/OS,
/// and failed widget builds.
///
/// Parameters:
/// - [errorLogger]: The [ErrorLogger] object used to log errors and exceptions.
///
void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'.hardcoded),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
