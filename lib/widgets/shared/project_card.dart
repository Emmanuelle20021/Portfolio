import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utils/int_to_gap.dart';
import 'package:portfolio/widgets/shared/social_media_icon_button.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/projects.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      project.images[0],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        BoxIcons.bx_error,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.cardPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          project.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        10.toVerticalGap,
                        Text(
                          project.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {
                                createDialog(context);
                              },
                              label: Text('Ver detalles'),
                              iconAlignment: IconAlignment.end,
                              icon: Icon(
                                Icons.arrow_outward_outlined,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Link(
              uri: Uri.parse(project.urlGit),
              builder: (context, followLink) => IconButton(
                onPressed: () => _launchURL(project.urlGit),
                icon: const Icon(
                  BoxIcons.bxl_github,
                ),
              ),
            ),
            if (project.urlPlaystore != null) ...[
              10.toHorizontalGap,
              Link(
                uri: Uri.parse(project.urlPlaystore!),
                builder: (context, followLink) => IconButton(
                  onPressed: () => _launchURL(project.urlPlaystore!),
                  icon: const Icon(
                    BoxIcons.bxl_play_store,
                  ),
                ),
              ),
            ],
            if (project.urlFigma != null) ...[
              10.toHorizontalGap,
              Link(
                uri: Uri.parse(project.urlFigma!),
                builder: (context, followLink) => IconButton(
                  onPressed: () => _launchURL(project.urlFigma!),
                  icon: const Icon(BoxIcons.bxl_figma),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Future<dynamic> createDialog(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(project.title),
        content: Container(
          constraints: BoxConstraints(
            maxWidth: 600,
          ),
          child: Column(
            spacing: AppSpacing.medium,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: AppSpacing.small,
                    children: [
                      for (var image in project.images) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            image,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Text(project.description),
              ),
              Row(
                children: [
                  SocialMediaIconButton(
                    icon: BoxIcons.bxl_github,
                    url: project.urlGit,
                  ),
                  if (project.urlPlaystore != null) ...[
                    10.toHorizontalGap,
                    SocialMediaIconButton(
                      icon: BoxIcons.bxl_play_store,
                      url: project.urlPlaystore!,
                    ),
                  ],
                  if (project.urlFigma != null) ...[
                    10.toHorizontalGap,
                    SocialMediaIconButton(
                      icon: BoxIcons.bxl_figma,
                      url: project.urlFigma!,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
