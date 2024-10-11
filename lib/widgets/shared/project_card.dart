import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/utils/int_to_gap.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.urlGit,
    this.urlPlaystore,
    this.urlFigma,
  });

  final String title;
  final String image;
  final String description;
  final String urlGit;
  final String? urlPlaystore;
  final String? urlFigma;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 250),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              fit: BoxFit.cover,
              image,
              width: double.infinity,
            ),
            10.toVerticalGap,
            Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  10.toVerticalGap,
                  Text(
                    description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  10.toVerticalGap,
                  Row(
                    children: [
                      Link(
                        uri: Uri.parse(urlGit),
                        builder: (context, followLink) => IconButton(
                          onPressed: () => _launchURL(urlGit),
                          style: IconButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                          icon: const Icon(
                            BoxIcons.bxl_github,
                          ),
                        ),
                      ),
                      if (urlPlaystore != null) ...[
                        10.toHorizontalGap,
                        Link(
                          uri: Uri.parse(urlPlaystore!),
                          builder: (context, followLink) => IconButton(
                            onPressed: () => _launchURL(urlPlaystore!),
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            icon: const Icon(
                              BoxIcons.bxl_play_store,
                            ),
                          ),
                        ),
                      ],
                      if (urlFigma != null) ...[
                        10.toHorizontalGap,
                        Link(
                          uri: Uri.parse(urlFigma!),
                          builder: (context, followLink) => IconButton(
                            onPressed: () => _launchURL(urlFigma!),
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            icon: const Icon(BoxIcons.bxl_figma),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
