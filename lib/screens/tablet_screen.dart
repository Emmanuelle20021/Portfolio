import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/shared/custom_drawer.dart';

class TabletScreen extends StatelessWidget {
  const TabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablet Screen'),
        actions: Constants.kActionsAppBar,
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text('Tablet Screen'),
      ),
    );
  }
}
