import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/app.dart';
import 'package:flutter_app/routes/route_guard.dart';
import 'package:flutter_app/routes/router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'bootstrap/boot.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Nylo.init(setup: Boot.nylo, setupFinished: Boot.finished);

  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  final _appRouter = AppRouter( authGuard: AuthGuard());

  runApp(ProviderScope(
    child: AppBuild(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
