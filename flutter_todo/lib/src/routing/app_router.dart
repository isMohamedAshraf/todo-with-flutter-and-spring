import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/src/features/splash/presentation/splash_screen.dart';
import 'package:flutter_todo/src/features/todo/presentation/todo_list_screen.dart';
import 'package:flutter_todo/src/start/app_startup.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';
part 'app_router.gr.dart';

@Riverpod(keepAlive: true)
Raw<AppRouter> appRouter(AppRouterRef ref) {
  final router = AppRouter(ref);

  return router;
}

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  final Ref ref;

  AppRouter(this.ref);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: AppStartupRoute.page, initial: true),
        AutoRoute(page: TodoListRoute.page),
      ];
}
