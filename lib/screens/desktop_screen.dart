import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';

import '../widgets/shared/custom_drawer.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desktop Screen'),
        actions: Constants.kActionsAppBar,
      ),
      body: const Row(
        children: [
          CustomDrawer(),
          Expanded(
            child: Center(
              child: Text('Desktop Screen'),
            ),
          ),
        ],
      ),
    );
  }
}
