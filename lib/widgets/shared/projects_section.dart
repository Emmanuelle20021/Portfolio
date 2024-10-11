import 'package:flutter/material.dart';
import 'package:portfolio/utils/int_to_gap.dart';

import '../../constants/constants.dart';

class Projects extends StatelessWidget {
  const Projects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Proyectos',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        30.toVerticalGap,
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.spaceAround,
          children: Constants.kProjects,
        ),
      ],
    );
  }
}
