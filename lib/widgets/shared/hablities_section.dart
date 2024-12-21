import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
      spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AutoSizeText(
          'Habilidades',
          minFontSize: 22,
          maxFontSize: 26,
          maxLines: 1,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
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
