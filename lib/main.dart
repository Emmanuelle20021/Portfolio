import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/cubits/sections_keys.dart';
import 'package:portfolio/screens/desktop_screen.dart';
import 'package:portfolio/screens/mobile_screen.dart';
import 'package:portfolio/screens/tablet_screen.dart';
import 'package:portfolio/widgets/responsive/responsive_layout.dart';
import 'package:portfolio/widgets/shared/custom_drawer.dart';
import 'package:portfolio/widgets/shared/image_profile.dart';

import 'constants/constants.dart';
import 'cubits/theme_cubit.dart';
import 'utils/injector.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Injector(
      profileImage: const ImageProfile(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<SectionsKeysCubit>(
            create: (context) => SectionsKeysCubit(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, theme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Constants.kAppName,
              theme: theme,
              home: Scaffold(
                appBar: Constants.kAppBar(),
                drawer: ResponsiveLayout.desktopSize <= width
                    ? null
                    : CustomDrawer(
                        scaffoldKey: scaffoldKey,
                      ),
                body: ResponsiveLayout(
                  desktopLayout: DesktopScreen(
                    scaffoldKey: scaffoldKey,
                  ),
                  tabletLayout: TabletScreen(),
                  mobileLayout: MobileScreen(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
