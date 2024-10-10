import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/cubits/theme_cubit.dart';

import '../widgets/shared/animated/animate_color_icon.dart';

class Constants {
  Constants._();

  static const String kAppName = 'Emma Mora Dev';
  static List<Widget> kActionsAppBar = [
    BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) => AnimateColorIcon(
        icon: Icons.light_mode,
        startColor:
            theme.brightness == Brightness.dark ? Colors.white : Colors.black,
        endColor:
            theme.brightness == Brightness.dark ? Colors.black : Colors.white,
      ),
    ),
  ];
}
