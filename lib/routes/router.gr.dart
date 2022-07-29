// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../resources/pages/home_page.dart' as _i1;
import '../resources/pages/login_page.dart' as _i2;
import 'route_guard.dart' as _i5;

class AppRouter extends _i3.RootStackRouter {
  AppRouter(
      {_i4.GlobalKey<_i4.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i5.AuthGuard authGuard;

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>(
          orElse: () => const MyHomeRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MyHomePage(key: args.key));
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage(onLogin: args.onLogin));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(MyHomeRoute.name, path: '/', guards: [authGuard]),
        _i3.RouteConfig(LoginRoute.name, path: '/login')
      ];
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i3.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({_i4.Key? key})
      : super(MyHomeRoute.name, path: '/', args: MyHomeRouteArgs(key: key));

  static const String name = 'MyHomeRoute';
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i3.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({dynamic Function(bool)? onLogin})
      : super(LoginRoute.name,
            path: '/login', args: LoginRouteArgs(onLogin: onLogin));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.onLogin});

  final dynamic Function(bool)? onLogin;

  @override
  String toString() {
    return 'LoginRouteArgs{onLogin: $onLogin}';
  }
}
