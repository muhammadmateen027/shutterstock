import 'package:flutter/material.dart';
import 'package:shutterstock/l10n/l10n.dart';

import 'routes_name.dart';
import 'transition_animation/transition_animation.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings setting) {

    switch (setting.name) {
      case RoutesName.initial:
        return PageTransition.slideUpRoute(Container());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      final l10n = _.l10n;
      return Scaffold(
        appBar: AppBar(title: Text(l10n.pageNotAvailableLabel)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Text(
              l10n.pageNotAvailableDescription,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    });
  }
}
