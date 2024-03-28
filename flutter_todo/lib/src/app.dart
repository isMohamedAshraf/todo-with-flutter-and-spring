import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/src/routing/app_router.dart';
import 'package:flutter_todo/src/routing/route_observer.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider).config(
          navRestorationScopeId: 'flutter_todo_restoration_scope_id',
          navigatorObservers: () => [ref.read(routeObserverProvider)],
        );
    return MaterialApp.router(
      routerConfig: appRouter,
      restorationScopeId: 'flutter_todo_restoration_scope_id',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.amber,
      ),
    );
  }
}
