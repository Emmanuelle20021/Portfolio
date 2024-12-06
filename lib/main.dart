import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/cubits/sections_keys.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/widgets/responsive/responsive_layout.dart';
import 'package:portfolio/widgets/shared/custom_drawer.dart';
import 'package:portfolio/widgets/shared/image_profile.dart';

import 'constants/constants.dart';
import 'utils/injector.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        (MediaQuery.of(context).size.width < ResponsiveLayout.tabletSize);
    return Injector(
      profileImage: const ImageProfile(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SectionsKeysCubit>(
            create: (context) => SectionsKeysCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.kAppName,
          theme: AppThemes.darkTheme,
          home: Scaffold(
            key: scaffoldKey,
            drawer: isMobile ? CustomDrawer(scaffoldKey: scaffoldKey) : null,
            extendBodyBehindAppBar: true,
            appBar: appBar(context, AppThemes.darkTheme, isMobile),
            body: HomeScreen(),
          ),
        ),
      ),
    );
  }

  AppBar appBar(context, ThemeData theme, bool isMobile) => AppBar(
        backgroundColor: isMobile
            ? theme.scaffoldBackgroundColor.withOpacity(0.8)
            : Colors.transparent,
        elevation: 0,
        title: !isMobile
            ? Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.large,
                  ),
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: AppColors.border,
                      width: 1,
                    ),
                  ),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        Constants.kSections.length,
                        (index) =>
                            BlocBuilder<SectionsKeysCubit, List<GlobalKey>>(
                                builder: (context, state) {
                          return TextButton(
                            child: Text(
                              Constants.kSections[index],
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                            onPressed: () {
                              Scrollable.ensureVisible(
                                state[index].currentContext!,
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
                        }),
                      ),
                    ),
                  ),
                ),
              )
            : null,
        notificationPredicate: (notification) => false,
      );
}
