import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/constants/constants.dart';
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
                      image,
                      fit: BoxFit.cover,
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
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        10.toVerticalGap,
                        Text(
                          description,
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
                              onPressed: () {},
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
              uri: Uri.parse(urlGit),
              builder: (context, followLink) => IconButton(
                onPressed: () => _launchURL(urlGit),
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
                  icon: const Icon(BoxIcons.bxl_figma),
                ),
              ),
            ],
          ],
        ),
      ],
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
