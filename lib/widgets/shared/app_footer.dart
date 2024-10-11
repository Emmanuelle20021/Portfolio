import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/widgets/shared/social_media_icon_button.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        children: [
          Expanded(
            child: AutoSizeText(
              'ⓒ Javier Emmanuelle Hipólito Mora. Todos los derechos reservados.',
              maxLines: 3,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SocialMediaIconButton(
            icon: BoxIcons.bxl_github,
            url: 'https://github.com/Emmanuelle20021',
          ),
          const SocialMediaIconButton(
            icon: BoxIcons.bxl_linkedin,
            url: 'https://www.linkedin.com/in/javier-emmanuelle-hipolito-mora',
          ),
        ],
      ),
    );
  }
}
