import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({required super.builder, RouteSettings? settings});

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // if (settings.name == '/') {
    //   return child;
    // }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
    // return super
    //     .buildTransitions(context, animation, secondaryAnimation, child);
  }
}

class CustomPageTransitionBuilder extends PageTransitionsBuilder {

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    // if (route.settings.name == '/') {
    //   return child;
    // }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
    // return super
    //     .buildTransitions(context, animation, secondaryAnimation, child);
  }
}
