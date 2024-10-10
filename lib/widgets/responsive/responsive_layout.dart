import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({
    super.key,
    required this.desktopLayout,
    required this.tabletLayout,
    required this.mobileLayout,
  });

  final Widget desktopLayout;
  final Widget tabletLayout;
  final Widget mobileLayout;

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

int get desktopSize => 1200;
int get tabletSize => 800;

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > desktopSize) {
          return widget.desktopLayout;
        } else if (constraints.maxWidth > tabletSize &&
            constraints.maxWidth < desktopSize) {
          return widget.tabletLayout;
        } else {
          return widget.mobileLayout;
        }
      },
    );
  }
}
