import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/shared/custom_drawer.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Screen'),
        actions: Constants.kActionsAppBar,
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text('Mobile Screen'),
      ),
    );
  }
}
