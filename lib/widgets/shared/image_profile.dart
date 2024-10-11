import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 4,
            ),
          ),
          child: CircleAvatar(
            radius: 100,
            backgroundImage: imageProvider,
          ),
        );
      },
      imageUrl:
          'https://portfolio-8b489.web.app/assets/assets/images/profile_Image.jpeg',
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
