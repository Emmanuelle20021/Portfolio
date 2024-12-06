import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utils/double_to_gap.dart';
import 'package:portfolio/widgets/shared/projects_section.dart';

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
            AppSpacing.sectionSpacing.toVerticalGap,
            AboutMe(
              key: state[0],
            ),
            AppSpacing.sectionSpacing.toVerticalGap,
            Projects(
              key: state[1],
            ),
          ],
        ),
      );
    });
  }
}
