import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utils/int_to_gap.dart';
import 'package:portfolio/widgets/shared/social_media_icon_button.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/projects.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  void initState() {
    super.initState();
    for (String image in widget.project.images) {
      precacheImage(AssetImage(image), context);
    }
  }

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
                    child: Image(
                      image: AssetImage(widget.project.images.first),
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
                          widget.project.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        10.toVerticalGap,
                        Text(
                          widget.project.description,
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
              uri: Uri.parse(widget.project.urlGit),
              builder: (context, followLink) => IconButton(
                onPressed: () => _launchURL(widget.project.urlGit),
                icon: const Icon(
                  BoxIcons.bxl_github,
                ),
              ),
            ),
            if (widget.project.urlPlaystore != null) ...[
              10.toHorizontalGap,
              Link(
                uri: Uri.parse(widget.project.urlPlaystore!),
                builder: (context, followLink) => IconButton(
                  onPressed: () => _launchURL(widget.project.urlPlaystore!),
                  icon: const Icon(
                    BoxIcons.bxl_play_store,
                  ),
                ),
              ),
            ],
            if (widget.project.urlFigma != null) ...[
              10.toHorizontalGap,
              Link(
                uri: Uri.parse(widget.project.urlFigma!),
                builder: (context, followLink) => IconButton(
                  onPressed: () => _launchURL(widget.project.urlFigma!),
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
        title: Text(widget.project.title),
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
                      for (var image in widget.project.images) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage(image),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Text(widget.project.description),
              ),
              Row(
                children: [
                  SocialMediaIconButton(
                    icon: BoxIcons.bxl_github,
                    url: widget.project.urlGit,
                  ),
                  if (widget.project.urlPlaystore != null) ...[
                    10.toHorizontalGap,
                    SocialMediaIconButton(
                      icon: BoxIcons.bxl_play_store,
                      url: widget.project.urlPlaystore!,
                    ),
                  ],
                  if (widget.project.urlFigma != null) ...[
                    10.toHorizontalGap,
                    SocialMediaIconButton(
                      icon: BoxIcons.bxl_figma,
                      url: widget.project.urlFigma!,
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
