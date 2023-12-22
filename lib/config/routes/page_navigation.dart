import 'package:flutter/material.dart';

enum PageTransitionType { rightToLeft, leftToRight, topToBottom, bottomToTop }

class CustomPageTransition extends PageRouteBuilder {
  final Widget child;
  final PageTransitionType type;
  CustomPageTransition({
    required this.child,
    required this.type,
  }) : super(pageBuilder: (context, animation, secondaryAnimation) {
          return child;
        });

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    switch (type) {
      case PageTransitionType.rightToLeft:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      case PageTransitionType.leftToRight:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      case PageTransitionType.topToBottom:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      case PageTransitionType.bottomToTop:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(animation),
          child: child,
        );
    }
  }
}
