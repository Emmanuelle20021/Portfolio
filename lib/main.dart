import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/screens/desktop_screen.dart';
import 'package:portfolio/screens/mobile_screen.dart';
import 'package:portfolio/screens/tablet_screen.dart';
import 'package:portfolio/widgets/responsive/responsive_layout.dart';

import 'constants/constants.dart';
import 'cubits/theme_cubit.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Constants.kAppName,
            theme: theme,
            home: const ResponsiveLayout(
              desktopLayout: DesktopScreen(),
              tabletLayout: TabletScreen(),
              mobileLayout: MobileScreen(),
            ),
          );
        },
      ),
    );
  }
}
