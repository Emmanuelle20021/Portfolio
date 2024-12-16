import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:portfolio/constants/constants.dart';

class ImageProfile extends StatefulWidget {
  const ImageProfile({
    super.key,
  });

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  @override
  void initState() {
    super.initState();
    precacheImage(AssetImage(Constants.kProfileImagePath), context);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.onSurface,
              theme.scaffoldBackgroundColor,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
      child: const CircleAvatar(
        radius: 100,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(Constants.kProfileImagePath),
      ),
    );
  }
}
