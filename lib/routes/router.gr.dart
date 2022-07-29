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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../resources/pages/home_page.dart' as _i1;
import '../resources/pages/login_page.dart' as _i2;
import '../resources/pages/signup_page.dart' as _i3;
import 'route_guard.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter(
      {_i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i6.AuthGuard authGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>(
          orElse: () => const MyHomeRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MyHomePage(key: args.key));
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage(onLogin: args.onLogin));
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.SignupPage(onLogin: args.onLogin));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MyHomeRoute.name, path: '/', guards: [authGuard]),
        _i4.RouteConfig(LoginRoute.name, path: '/login'),
        _i4.RouteConfig(SignupRoute.name, path: '/signup')
      ];
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i4.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({_i5.Key? key})
      : super(MyHomeRoute.name, path: '/', args: MyHomeRouteArgs(key: key));

  static const String name = 'MyHomeRoute';
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<LoginRouteArgs> {
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

/// generated route for
/// [_i3.SignupPage]
class SignupRoute extends _i4.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({dynamic Function(bool)? onLogin})
      : super(SignupRoute.name,
            path: '/signup', args: SignupRouteArgs(onLogin: onLogin));

  static const String name = 'SignupRoute';
}

class SignupRouteArgs {
  const SignupRouteArgs({this.onLogin});

  final dynamic Function(bool)? onLogin;

  @override
  String toString() {
    return 'SignupRouteArgs{onLogin: $onLogin}';
  }
}
