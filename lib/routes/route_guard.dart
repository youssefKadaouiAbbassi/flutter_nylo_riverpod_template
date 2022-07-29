import 'package:auto_route/auto_route.dart';
import 'package:flutter_app/routes/router.gr.dart';

import '../app/models/user.dart';
import '../app/networking/auth_api_service.dart';

class AuthGuard extends AutoRouteGuard  {

  AuthApiService userApiService = AuthApiService();
  bool guard = true;

  RouteGuard() {
    userApiService.getUser().then((user) {
      if (user != null && user.getId() != null) {
        this.guard = false;
      }
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    User? user  = await userApiService.getUser();
    if (user != null && user.getId() != null) {
      this.guard = false;
    }

    if(!this.guard) {
      // if user is authenticated we continue
      resolver.next(true);
    }else{
      // we redirect the user to our login page
      router.push(LoginRoute(
        onLogin: (bool success) {
          if (success) {
            resolver.next();
            router.removeLast();
          }
        },
      ),);
    }
  }
}