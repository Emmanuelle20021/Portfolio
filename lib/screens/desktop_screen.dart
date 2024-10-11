import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utils/double_to_gap.dart';
import 'package:portfolio/utils/int_to_gap.dart';
import 'package:portfolio/widgets/shared/app_footer.dart';
import 'package:portfolio/widgets/shared/hablities_section.dart';

import '../widgets/shared/body_decoration.dart';
import '../widgets/shared/circle_decoration.dart';
import '../widgets/shared/projects_section.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double pad = MediaQuery.of(context).size.width * 0.1;
    final double verticalGap = MediaQuery.of(context).size.height * 0.05;
    return Scaffold(
      appBar: Constants.kAppBar(
        children: [
          AutoSizeText(
            'Javier Emmanuelle Hipólito Mora',
            minFontSize: 20,
            maxFontSize: 26,
            maxLines: 1,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          AutoSizeText(
            'Ingeniero de Software',
            maxLines: 1,
            minFontSize: 16,
            maxFontSize: 18,
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
                  padding: EdgeInsets.symmetric(
                    horizontal: pad,
                  ),
                  child: BodyDecoration(
                    children: [
                      const AboutMeDesktop(),
                      verticalGap.toVerticalGap,
                      const HabilitiesSection(
                        spacing: 60,
                      ),
                      verticalGap.toVerticalGap,
                      const Projects(),
                    ],
                  ),
                ),
                verticalGap.toVerticalGap,
                const AppFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutMeDesktop extends StatelessWidget {
  const AboutMeDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Sobre mi',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        30.toVerticalGap,
        Row(
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
            20.toHorizontalGap,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  Constants.kAboutMeText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
