import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(appStartupProvider, (_, next) {
    //   context.router
    //       .pushAndPopUntil(const TodoListRoute(), predicate: (_) => false);
    // });

    // final appStartupState = ref.watch(appStartupProvider);

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
