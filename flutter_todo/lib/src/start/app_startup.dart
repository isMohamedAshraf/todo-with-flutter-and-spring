import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/src/features/splash/presentation/splash_screen.dart';
import 'package:flutter_todo/src/routing/app_router.dart';
import 'package:flutter_todo/src/start/app_startup_error.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    // ensure we invalidate all the providers we depend on
  });
  // all asynchronous app initialization code should belong here:
  await Future.delayed(const Duration(seconds: 5));
  ref.read(appRouterProvider).pushAndPopUntil(
        const TodoListRoute(),
        predicate: (_) => false,
      );
}

/// Widget class to manage asynchronous app initialization
@RoutePage()
class AppStartupScreen extends ConsumerWidget {
  const AppStartupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.maybeWhen(
      loading: () => const SplashScreen(),
      error: (e, st) => AppStartupErrorWidget(
        message: e.toString(),
        onRetry: () {
          ref.invalidate(appStartupProvider);
        },
      ),
      // Will not reach this
      orElse: () => const CircularProgressIndicator(),
    );
  }
}
