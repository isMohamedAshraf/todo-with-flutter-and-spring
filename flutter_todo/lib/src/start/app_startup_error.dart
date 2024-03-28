import 'package:flutter/material.dart';
import 'package:flutter_todo/src/localization/string_hardcoded.dart';

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;

  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('App Startup Failed'.hardcoded),
            Text(message),
            ElevatedButton(
              onPressed: onRetry,
              child: Text('Try Again'.hardcoded),
            ),
          ],
        ),
      ),
    );
  }
}
