import 'package:flutter/material.dart';

class Injector extends InheritedWidget {
  const Injector({
    super.key,
    required super.child,
    required this.profileImage,
  });

  final Widget profileImage;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Injector of(BuildContext context) {
    final Injector? injector =
        context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, 'No Injector found in context');
    return injector!;
  }
}
