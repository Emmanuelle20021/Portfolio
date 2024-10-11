import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 4,
        ),
      ),
      child: const CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('assets/images/profile_Image.jpeg'),
      ),
    );
  }
}
