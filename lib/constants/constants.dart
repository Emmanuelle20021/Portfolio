import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/models/experience.dart';
import 'package:portfolio/models/projects.dart';
import 'package:portfolio/utils/int_to_gap.dart';

import '../widgets/shared/habilities_card.dart';
import '../widgets/shared/icon_with_text.dart';
import '../widgets/shared/project_card.dart';
import '../widgets/shared/social_media_icon_button.dart';

class Constants {
  Constants._();

  static const String kSharkPath = 'assets/parallax/Shark.svg';
  static const String kProfileImagePath = 'assets/images/profile_Image.png';
  static const String kVitiumBannerPath = 'assets/images/vitium_banner.png';
  static const String kStoreMatePath = 'assets/images/store_mate.png';
  static const String kRockPath = 'assets/parallax/Rock.svg';
  static const String kKelp1Path = 'assets/parallax/kelp_1.svg';
  static const String kKelp2Path = 'assets/parallax/kelp_2.svg';
  static const String kKelpGroupPath = 'assets/parallax/kelp_group.svg';
  static const String kRockGroupPath = 'assets/parallax/rock_group.svg';

  static const String kAppName = 'Emma Mora Dev';
  static Widget kActionsAppBar = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SocialMediaIconButton(
        icon: BoxIcons.bxl_github,
        url: 'https://github.com/Emmanuelle20021',
      ),
      10.toHorizontalGap,
      const SocialMediaIconButton(
        icon: BoxIcons.bxl_linkedin,
        url: 'https://www.linkedin.com/in/javier-emmanuelle-hipolito-mora',
      ),
    ],
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
          ],
        ),
        HabilitiesCardWidget(
          title: 'Diseño de interfaces',
          children: [
            10.toVerticalGap,
            const IconWithText(
              title: 'Figma',
              icon: BoxIcons.bxl_figma,
            ),
          ],
        ),
      ];

  static const List<String> kSections = [
    'Sobre mi',
    'Proyectos',
    'Experiencia',
    'Contacto',
  ];

  static List<Widget> get kProjects => [
        ProjectCard(
          project: Project(
            title: 'Vitium',
            images: ['assets/images/vitium_banner.png'],
            description:
                'Vitium es una aplicación móvil desarrollada con Flutter y Firebase. Es una bolsa de trabajo para personas con discapasidad. Permite a los usuarios buscar y postularse a ofertas de empleo, así como a los empleadores publicar vacantes y gestionar postulaciones.',
            urlGit: 'https://github.com/Emmanuelle20021/vitium-app',
            urlFigma:
                'https://www.figma.com/design/FXmWufDgVBtI3OIZcMZJd6/Vitium_v3?node-id=7-24946&t=Arqk5i0hyxm1iAwy-1',
          ),
        ),
        ProjectCard(
          project: Project(
            title: 'StoreMate',
            images: ['assets/images/store_mate.png'],
            description:
                'StoreMate es una innovadora aplicación móvil diseñada para empoderar a propietarios de pequeños negocios al proporcionarles una solución completa de punto de venta en la palma de su mano.',
            urlGit: 'https://github.com/Emmanuelle20021/StoreMate',
            urlFigma:
                'https://www.figma.com/design/VXqSW0L8sWF0pSLGmiEf8u/Shop-Mate?node-id=0-1&t=ClaNV7U23HCDyKgr-1',
          ),
        ),
      ];

  static const List<Experience> kExperiences = [
    Experience(
      company: "Vitium",
      position: "Líder de Desarrollo",
      date: "Enero 2022 - Presente",
      description:
          "Dirijo un equipo en el desarrollo de una bolsa de trabajo inclusiva que obtuvo premios internacionales, integrando mapas, Firebase y arquitectura limpia.",
    ),
    Experience(
      company: "Freelancer Remoto",
      position: "Desarrollador Web y Móvil",
      date: "2023 - 2024",
      description:
          "Colaboré en proyectos para empresas, incluyendo desarrollo de plataformas de e-learning y aplicaciones móviles personalizadas.",
    ),
    Experience(
      company: "No Country",
      position: "Desarrollador Flutter",
      date: "2023",
      description:
          "Desarrollé una plataforma e-learning utilizando Flutter y patrones de diseño robustos.",
    ),
    Experience(
      company: "Proyectos Personales",
      position: "Desarrollador Flutter",
      date: "2022 - Presente",
      description:
          "Cree aplicaciones como un punto de venta con SQLite y una bolsa de trabajo, integrando funcionalidades avanzadas.",
    ),
    Experience(
      company: "Prácticas Universitarias",
      position: "Desarrollador Web Remoto",
      date: "2021 - 2022",
      description:
          "Desarrollé soluciones web mientras adquiría experiencia en trabajo remoto y metodologías ágiles.",
    ),
  ];
}

class AppTextStyles {
  // Tamaños de texto
  static const double heading1 = 32.0;
  static const double heading2 = 24.0;
  static const double heading3 = 20.0;
  static const double bodyText = 16.0;
  static const double button = 16.0;
  static const double caption = 14.0;
}

class AppSpacing {
  // Espaciados y padding
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;
  static const double cardPadding =
      16.0; // Padding estándar para tarjetas y contenedores
  static const double sectionSpacing = 32.0; // Espaciado entre secciones
}

class AppColors {
  // Colores para Dark Theme
  static const Color background = Color(0xFF0A2239);
  static const Color surface = Color(0xFF1E4C6B);
  static const Color primaryText = Color(0xFFF1F1F1);
  static const Color secondaryText = Color(0xFFA2D2FF);
  static const Color accent = Color(0xFF5CDBE6);
  static const Color border = Color(0xFF406882);
  static const Color sharks = Color(0xFF1B3C59);
  static const Color kelpDark = Color(0xFF2C665E);
  static const Color kelpLight = Color(0xFF3FA896);
}

class AppThemes {
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.accent,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          surface: AppColors.surface,
          onPrimary: AppColors.primaryText,
          onSurface: AppColors.secondaryText,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface,
          iconTheme: IconThemeData(color: AppColors.primaryText),
          titleTextStyle: TextStyle(
            color: AppColors.primaryText,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.secondaryText),
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(
            displayLarge: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText),
            displayMedium: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText),
            displaySmall: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryText),
            headlineLarge: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText),
            headlineMedium:
                TextStyle(fontSize: 20.0, color: AppColors.primaryText),
            headlineSmall:
                TextStyle(fontSize: 18.0, color: AppColors.primaryText),
            titleLarge: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText),
            titleMedium:
                TextStyle(fontSize: 14.0, color: AppColors.primaryText),
            titleSmall: TextStyle(fontSize: 12.0, color: AppColors.primaryText),
            bodyLarge: TextStyle(fontSize: 16.0, color: AppColors.primaryText),
            bodyMedium: TextStyle(fontSize: 14.0, color: AppColors.primaryText),
            bodySmall: TextStyle(fontSize: 12.0, color: AppColors.primaryText),
            labelLarge: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: AppColors.accent),
            labelMedium: TextStyle(fontSize: 12.0, color: AppColors.accent),
            labelSmall: TextStyle(fontSize: 10.0, color: AppColors.accent),
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.accent,
          textTheme: ButtonTextTheme.primary,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.accent,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColors.surface,
        ),
      );
}
