import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/int_to_gap.dart';

import '../../constants/constants.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({
    super.key,
  });

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final List<String> links = [
    "https://www.uv.mx/coatza/admon/nosotros/pre-rec/",
    "https://www.uv.mx/coatza/admon/general/xvii-expo-nac-empren-anfeca-23/",
    "https://www.uv.mx/coatza/general/innovacion-y-desarrollo-en-el-sur-de-veracruz/",
    "https://www.uv.mx/prensa/general/uv-region-coatzacoalcos-destaco-en-xvi-maraton-de-conocimientos-anfeca/",
  ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 1000,
        minHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Sobre mi',
                  minFontSize: 22,
                  maxFontSize: 26,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                20.toVerticalGap,
                Text(
                  Constants.kAboutMeText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
