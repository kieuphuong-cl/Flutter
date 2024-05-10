import 'package:brainiaccommerce2/core/config/route/route_path.dart';
import 'package:flutter/material.dart';

Route<dynamic> appRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RoutePath.root:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );

    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}
