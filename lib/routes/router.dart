// @CupertinoAutoRouter
// @AdaptiveAutoRouter              
// @CustomAutoRouter              
import 'package:auto_route/annotations.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/pages/login_page.dart';
import 'package:flutter_app/resources/pages/signup_page.dart';
import 'package:flutter_app/routes/route_guard.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true, guards: [AuthGuard]),
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(page: SignupPage, path: '/signup'),
  ],
)
class $AppRouter {}  