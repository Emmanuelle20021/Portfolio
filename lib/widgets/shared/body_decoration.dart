import 'package:flutter/material.dart';

class BodyDecoration extends StatelessWidget {
  const BodyDecoration({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children,
    );
  }
}
