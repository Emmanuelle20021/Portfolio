import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/cubits/theme_cubit.dart';
import 'package:portfolio/utils/int_to_gap.dart';

import '../widgets/shared/animated/animate_color_icon.dart';
import '../widgets/shared/habilities_card.dart';
import '../widgets/shared/icon_with_text.dart';
import '../widgets/shared/project_card.dart';

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
  static AppBar kAppBar({required List<Widget> children}) => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
        actions: kActionsAppBar,
        notificationPredicate: (notification) => false,
      );

  static const String kAboutMeText =
      'Soy un desarrollador Flutter apasionado por crear aplicaciones móviles innovadoras y eficientes. Con experiencia en tecnologías como Dart, Node.js, Firebase, SQL y Git, me especializo en desarrollar soluciones robustas y escalables. Mi enfoque se centra en la creación de interfaces de usuario intuitivas y en la optimización del rendimiento de las aplicaciones.';

  static List<Widget> kHabilities(context) => [
        HabilitiesCardWidget(
          title: 'Desarrollo móvil',
          children: [
            10.toVerticalGap,
            const IconWithText(
              title: 'Flutter',
              icon: BoxIcons.bxl_flutter,
            ),
            10.toVerticalGap,
            const IconWithText(
              title: 'Dart',
              icon: BoxIcons.bxl_flutter,
            ),
          ],
        ),
        HabilitiesCardWidget(
          title: 'Desarrollo web',
          children: [
            10.toVerticalGap,
            const IconWithText(
              title: 'HTML',
              icon: BoxIcons.bxl_html5,
            ),
            10.toVerticalGap,
            const IconWithText(
              title: 'CSS',
              icon: BoxIcons.bxl_css3,
            ),
            10.toVerticalGap,
            const IconWithText(
              title: 'JavaScript',
              icon: BoxIcons.bxl_javascript,
            ),
            10.toVerticalGap,
            const IconWithText(
              title: 'Node.js',
              icon: BoxIcons.bxl_nodejs,
            ),
          ],
        ),
        HabilitiesCardWidget(
          title: 'Bases de datos',
          children: [
            10.toVerticalGap,
            const IconWithText(
              title: 'Firebase',
              icon: BoxIcons.bxl_firebase,
            ),
            10.toVerticalGap,
            const IconWithText(
              title: 'SQL',
              icon: BoxIcons.bxl_postgresql,
            ),
          ],
        ),
        HabilitiesCardWidget(
          title: 'Control de versiones',
          children: [
            10.toVerticalGap,
            const IconWithText(
              title: 'Git',
              icon: BoxIcons.bxl_git,
            ),
            10.toVerticalGap,
            const IconWithText(
              title: 'GitHub',
              icon: BoxIcons.bxl_github,
            ),
            10.toVerticalGap,
            const IconWithText(
              title: 'GitLab',
              icon: BoxIcons.bxl_gitlab,
            ),
            10.toVerticalGap,
            const IconWithText(
              title: 'Figma',
              icon: BoxIcons.bxl_figma,
            ),
          ],
        ),
      ];

  static List<Widget> get kProjects => [
        const ProjectCard(
          title: 'Vitium',
          image: 'assets/images/vitium_banner.png',
          description:
              'Vitium es una aplicación móvil desarrollada con Flutter y Firebase. Es una bolsa de trabajo para personas con discapasidad. Permite a los usuarios buscar y postularse a ofertas de empleo, así como a los empleadores publicar vacantes y gestionar postulaciones.',
          urlGit: 'https://github.com/Emmanuelle20021/vitium-app',
          urlFigma:
              'https://www.figma.com/design/FXmWufDgVBtI3OIZcMZJd6/Vitium_v3?node-id=7-24946&t=Arqk5i0hyxm1iAwy-1',
        ),
        const ProjectCard(
          title: 'StoreMate',
          image: 'assets/images/store_mate.png',
          description:
              'StoreMate es una innovadora aplicación móvil diseñada para empoderar a propietarios de pequeños negocios al proporcionarles una solución completa de punto de venta en la palma de su mano.',
          urlGit:
              'StoreMate es una innovadora aplicación móvil diseñada para empoderar a propietarios de pequeños negocios al proporcionarles una solución completa de punto de venta en la palma de su mano.',
          urlFigma:
              'https://www.figma.com/design/VXqSW0L8sWF0pSLGmiEf8u/Shop-Mate?node-id=0-1&t=ClaNV7U23HCDyKgr-1',
        ),
      ];

  static const kProfileImage = AssetImage('assets/images/profile_Image.jpeg');
}

class AppColors {
  // Colores generales
  static const Color lightPrimary = Color(0xFF007BFF); // Azul moderado
  static const Color lightSecondary = Color(0xFF32CD32); // Verde lima
  static const Color lightScaffoldBackground =
      Color(0xFFF3F3F3); // Gris claro suave
  static const Color lightText = Color(0xFF0F0F0F); // Negro suave para texto

  static const Color darkPrimary = Color(0xFF607D8B); // Azul grisáceo
  static const Color darkSecondary = Color(0xFFFFA726); // Naranja acentuado
  static const Color darkScaffoldBackground =
      Color(0xFF121212); // Gris oscuro (evitando negro puro)
  static const Color darkText = Color(0xFFF3F3F3); // Blanco suave para texto

  // Colores de acento
  static const Color accentGreen = Color(0xFF32CD32); // Verde lima neón
  static const Color accentOrange = Color(0xFFFFA726); // Naranja brillante
  static const Color drawerScrim =
      Color(0x8A000000); // Negro con transparencia para el Drawer
}

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.lightPrimary,
        colorScheme: const ColorScheme.light(
          primary: AppColors.lightPrimary,
          secondary: AppColors.lightSecondary,
        ),
        scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightPrimary,
          iconTheme: IconThemeData(color: AppColors.lightText),
        ),
        iconTheme: const IconThemeData(color: AppColors.lightText),
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(
            displayLarge: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: AppColors.lightText),
            displayMedium:
                TextStyle(fontSize: 28.0, color: AppColors.lightText),
            displaySmall:
                TextStyle(fontSize: 24.0, color: AppColors.lightSecondary),
            headlineLarge:
                TextStyle(fontSize: 22.0, color: AppColors.lightText),
            headlineMedium:
                TextStyle(fontSize: 20.0, color: AppColors.lightText),
            headlineSmall:
                TextStyle(fontSize: 18.0, color: AppColors.lightText),
            titleLarge: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: AppColors.lightText),
            titleMedium: TextStyle(fontSize: 14.0, color: AppColors.lightText),
            titleSmall: TextStyle(fontSize: 12.0, color: AppColors.lightText),
            bodyLarge: TextStyle(fontSize: 16.0, color: AppColors.lightText),
            bodyMedium: TextStyle(fontSize: 14.0, color: AppColors.lightText),
            bodySmall: TextStyle(fontSize: 12.0, color: AppColors.lightText),
            labelLarge: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: AppColors.accentGreen),
            labelMedium:
                TextStyle(fontSize: 12.0, color: AppColors.accentGreen),
            labelSmall: TextStyle(fontSize: 10.0, color: AppColors.accentGreen),
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.accentGreen,
          textTheme: ButtonTextTheme.primary,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.accentGreen,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColors.lightScaffoldBackground,
          scrimColor: AppColors.drawerScrim,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.darkPrimary,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.darkPrimary,
          secondary: AppColors.darkSecondary,
        ),
        scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkPrimary,
          iconTheme: IconThemeData(color: AppColors.darkText),
        ),
        iconTheme: const IconThemeData(color: AppColors.darkText),
        textTheme: GoogleFonts.robotoTextTheme(
          const TextTheme(
            displayLarge: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: AppColors.darkText),
            displayMedium: TextStyle(fontSize: 28.0, color: AppColors.darkText),
            displaySmall:
                TextStyle(fontSize: 24.0, color: AppColors.darkSecondary),
            headlineLarge: TextStyle(fontSize: 22.0, color: AppColors.darkText),
            headlineMedium:
                TextStyle(fontSize: 20.0, color: AppColors.darkText),
            headlineSmall: TextStyle(fontSize: 18.0, color: AppColors.darkText),
            titleLarge: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: AppColors.darkText),
            titleMedium: TextStyle(fontSize: 14.0, color: AppColors.darkText),
            titleSmall: TextStyle(fontSize: 12.0, color: AppColors.darkText),
            bodyLarge: TextStyle(fontSize: 16.0, color: AppColors.darkText),
            bodyMedium: TextStyle(fontSize: 14.0, color: AppColors.darkText),
            bodySmall: TextStyle(fontSize: 12.0, color: AppColors.darkText),
            labelLarge: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: AppColors.accentOrange),
            labelMedium:
                TextStyle(fontSize: 12.0, color: AppColors.accentOrange),
            labelSmall:
                TextStyle(fontSize: 10.0, color: AppColors.accentOrange),
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.accentOrange,
          textTheme: ButtonTextTheme.primary,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.accentOrange,
        ),
      );
}
