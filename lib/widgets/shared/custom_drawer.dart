import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/constants.dart';

import '../../cubits/sections_keys.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.border,
                  width: 2,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Emma Mora\n',
                        style: theme.textTheme.displayLarge?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: 'Ingeniero de Software',
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Constants.kActionsAppBar,
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.small),
          ...List.generate(
            Constants.kSections.length,
            (index) {
              return ListTile(
                title: Text(Constants.kSections[index]),
                onTap: () {
                  Scrollable.ensureVisible(
                    context
                        .read<SectionsKeysCubit>()
                        .getKey(index)
                        .currentContext!,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeInOut,
                  );
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    Navigator.of(context).pop();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
