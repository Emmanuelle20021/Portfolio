import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/models/experience.dart';
import 'package:portfolio/utils/double_to_gap.dart';
import 'package:portfolio/widgets/shared/app_footer.dart';
import 'package:portfolio/widgets/shared/projects_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../cubits/sections_keys.dart';
import '../widgets/shared/about_me.dart';
import '../widgets/shared/image_profile.dart';
import '../widgets/shared/shark_background_parallax.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return BlocBuilder<SectionsKeysCubit, List<GlobalKey>>(
      builder: (context, state) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: AppSpacing.sectionSpacing,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    SharkBackgroundParallax(
                      scrollController: _scrollController,
                    ),
                    SafeArea(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ImageProfile(),
                            AppSpacing.small.toVerticalGap,
                            Constants.kActionsAppBar,
                            AppSpacing.small.toVerticalGap,
                            Text(
                              'Hola, Soy',
                              style: theme.textTheme.displayMedium,
                            ),
                            Text(
                              'Emma Mora',
                              style: theme.textTheme.displayLarge?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            const SizedBox(
                              height: AppSpacing.medium,
                            ),
                            Text(
                              'Soy Ingeniero de Software',
                              style: theme.textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AboutMe(
                key: state[0],
              ),
              Projects(
                key: state[1],
              ),
              ExpereincesSection(
                theme: theme,
                key: state[2],
              ),
              Container(
                key: state[3],
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 1000,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.cardPadding,
                ),
                child: Text(
                  textAlign: TextAlign.start,
                  'Contactame',
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 1000,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.cardPadding,
                ),
                child: ListTile(
                  title: Text('Email'),
                  leading: Icon(Icons.email),
                  trailing: Icon(
                    Icons.open_in_new,
                  ),
                  onTap: () async {
                    await launchUrlString('mailto:emmanu20021@gmail.com');
                  },
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 1000,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.cardPadding,
                ),
                child: ListTile(
                  title: Text('LinkedIn'),
                  leading: Icon(BoxIcons.bxl_linkedin),
                  trailing: Icon(
                    Icons.open_in_new,
                  ),
                  onTap: () async {
                    Uri uri = Uri.parse(
                      'https://www.linkedin.com/in/javier-emmanuelle-hipolito-mora/',
                    );
                    await launchUrl(uri);
                  },
                ),
              ),
              AppFooter(),
            ],
          ),
        );
      },
    );
  }
}

class ExpereincesSection extends StatelessWidget {
  const ExpereincesSection({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1000,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.small,
        children: [
          Text(
            'Experiencia',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Constants.kExperiences.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(
                bottom: AppSpacing.small,
              ),
              child: ExperienceCard(
                theme: theme,
                experience: Constants.kExperiences[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,
    required this.theme,
    required this.experience,
  });

  final ThemeData theme;
  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSpacing.medium,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: theme.colorScheme.secondary,
          child: Text(
            '${Constants.kExperiences.indexOf(experience) + 1}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                experience.company,
                style: theme.textTheme.labelLarge,
              ),
              Text(
                experience.position,
                style: theme.textTheme.labelMedium,
              ),
              Text(
                experience.date,
                style: theme.textTheme.labelMedium,
              ),
              AppSpacing.small.toVerticalGap,
              Text(
                experience.description,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
