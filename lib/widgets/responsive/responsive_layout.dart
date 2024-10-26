import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({
    super.key,
    required this.desktopLayout,
    required this.tabletLayout,
    required this.mobileLayout,
  });

  static int get desktopSize => 1200;
  static int get tabletSize => 800;

  final Widget desktopLayout;
  final Widget tabletLayout;
  final Widget mobileLayout;

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > ResponsiveLayout.desktopSize) {
          return widget.desktopLayout;
        } else if (constraints.maxWidth > ResponsiveLayout.tabletSize &&
            constraints.maxWidth < ResponsiveLayout.tabletSize) {
          return widget.tabletLayout;
        } else {
          return widget.mobileLayout;
        }
      },
    );
  }
}
