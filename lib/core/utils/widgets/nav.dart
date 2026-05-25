import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  static void push(BuildContext context, String location,{Object? extra}) {
    GoRouter.of(context).push(location,extra:extra );
  }

  static void pushReplacement(BuildContext context, String location) {
    GoRouter.of(context).pushReplacement(location);
  }

  static void pop(BuildContext context) {
    GoRouter.of(context).pop();
  }
  static void pushandRemoveUntil(BuildContext context, String location) {
    Navigator.of(context).pushNamedAndRemoveUntil(location, (route) => false);
  }

}
