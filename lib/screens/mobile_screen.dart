import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utils/double_to_gap.dart';
import 'package:portfolio/utils/int_to_gap.dart';

import '../cubits/sections_keys.dart';
import '../utils/injector.dart';
import '../widgets/shared/app_footer.dart';
import '../widgets/shared/body_decoration.dart';
import '../widgets/shared/circle_decoration.dart';
import '../widgets/shared/hablities_section.dart';
import '../widgets/shared/projects_section.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double verticalGap = MediaQuery.of(context).size.height * 0.05;
    final keys = context.read<SectionsKeysCubit>().keys;

    return Stack(
      children: [
        const Positioned(
          top: 0,
          right: 0,
          child: CircleDecoration(),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              verticalGap.toVerticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BodyDecoration(
                  children: [
                    AboutMeMobile(
                      key: keys[0],
                    ),
                    verticalGap.toVerticalGap,
                    HabilitiesSection(
                      key: keys[1],
                    ),
                    verticalGap.toVerticalGap,
                    Projects(
                      key: keys[2],
                    ),
                  ],
                ),
              ),
              20.toVerticalGap,
              const AppFooter(),
            ],
          ),
        ),
      ],
    );
  }
}

class AboutMeMobile extends StatelessWidget {
  const AboutMeMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Injector.of(context).profileImage,
            20.toVerticalGap,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Javier Emmanuelle Hipólito Mora',
                    minFontSize: 20,
                    maxFontSize: 26,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    'Ingeniero de Software',
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 20,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  30.toVerticalGap,
                  AutoSizeText(
                    maxLines: 10,
                    minFontSize: 5,
                    Constants.kAboutMeText,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
