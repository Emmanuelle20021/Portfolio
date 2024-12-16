import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:portfolio/constants/constants.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    super.key,
  });

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
