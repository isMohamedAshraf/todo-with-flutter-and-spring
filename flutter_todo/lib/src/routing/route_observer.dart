import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_observer.g.dart';

@Riverpod(keepAlive: true)
RouteObserver routeObserver(RouteObserverRef ref) {
  return RouteObserver(ref);
}

class RouteObserver extends AutoRouteObserver {
  final Ref ref;

  RouteObserver(this.ref);

  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('New route pushed: ${route.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint(
        'Popped Route: ${previousRoute?.settings.name} \nNew route pushed: ${route.settings.name} ');
    super.didPop(route, previousRoute);
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    debugPrint('Tab route visited: ${route.name}');
    super.didInitTabRoute(route, previousRoute);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    debugPrint('Tab route re-visited: ${route.name}');
    super.didChangeTabRoute(route, previousRoute);
  }
}
