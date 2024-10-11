import 'package:flutter/material.dart';
import 'package:portfolio/utils/int_to_gap.dart';

import '../../constants/constants.dart';

class HabilitiesSection extends StatelessWidget {
  const HabilitiesSection({
    super.key,
    this.spacing = 30,
  });
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Habilidades',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        30.toVerticalGap,
        Wrap(
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.spaceBetween,
          spacing: spacing,
          children: Constants.kHabilities(context),
        ),
      ],
    );
  }
}
