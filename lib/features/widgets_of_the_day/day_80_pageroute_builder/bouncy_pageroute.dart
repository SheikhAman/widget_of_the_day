import 'package:flutter/material.dart';

class BouncyPageRoute extends PageRouteBuilder {
  final Widget page;

  BouncyPageRoute({
    required this.page,
  }) : super(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (
        context,
        animation,
        secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
        ) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.elasticOut,
      );

      return ScaleTransition(
        scale: curvedAnimation,
        alignment: Alignment.center,
        child: child,
      );
    },
  );
}