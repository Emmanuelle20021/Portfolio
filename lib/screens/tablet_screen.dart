import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utils/double_to_gap.dart';
import 'package:portfolio/utils/int_to_gap.dart';
import 'package:portfolio/widgets/shared/app_footer.dart';
import 'package:portfolio/widgets/shared/hablities_section.dart';

import '../cubits/sections_keys.dart';
import '../utils/injector.dart';
import '../widgets/shared/body_decoration.dart';
import '../widgets/shared/circle_decoration.dart';
import '../widgets/shared/projects_section.dart';

class TabletScreen extends StatelessWidget {
  const TabletScreen({super.key});

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
                    AboutMeTablet(
                      key: keys[0],
                    ),
                    verticalGap.toVerticalGap,
                    HabilitiesSection(
                      key: keys[1],
                      spacing: 60,
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

class AboutMeTablet extends StatelessWidget {
  const AboutMeTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Injector.of(context).profileImage,
            20.toHorizontalGap,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Javier Emmanuelle Hipólito Mora',
                      minFontSize: 22,
                      maxFontSize: 28,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    AutoSizeText(
                      'Ingeniero de Software',
                      maxLines: 1,
                      minFontSize: 18,
                      maxFontSize: 24,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    20.toVerticalGap,
                    Text(
                      Constants.kAboutMeText,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
