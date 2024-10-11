import 'package:flutter/material.dart';
import 'package:portfolio/utils/int_to_gap.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        10.toHorizontalGap,
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
