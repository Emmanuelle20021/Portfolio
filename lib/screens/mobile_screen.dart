import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utils/double_to_gap.dart';
import 'package:portfolio/utils/int_to_gap.dart';

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
    return Scaffold(
      appBar: Constants.kAppBar(
        children: [
          AutoSizeText(
            'Javier Emmanuelle Hipólito Mora',
            minFontSize: 16,
            maxFontSize: 18,
            style: Theme.of(context).textTheme.titleLarge,
            maxLines: 1,
          ),
          AutoSizeText(
            'Ingeniero de Software',
            maxLines: 1,
            minFontSize: 12,
            maxFontSize: 14,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
      body: Stack(
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
                      const AboutMeMobile(),
                      verticalGap.toVerticalGap,
                      const HabilitiesSection(),
                      verticalGap.toVerticalGap,
                      const Projects(),
                    ],
                  ),
                ),
                20.toVerticalGap,
                const AppFooter(),
              ],
            ),
          ),
        ],
      ),
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
        Text(
          'Sobre mi',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        30.toVerticalGap,
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 4,
                ),
              ),
              child: const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                  'assets/images/profile_Image.jpeg',
                ),
              ),
            ),
            20.toVerticalGap,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AutoSizeText(
                maxLines: 10,
                minFontSize: 5,
                Constants.kAboutMeText,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
