import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/constants.dart';

import '../../cubits/sections_keys.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(),
      child: Center(
        child: ListView.builder(
          itemCount: Constants.kSections.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(Constants.kSections[index]),
              onTap: () {
                Scrollable.ensureVisible(
                  context
                      .read<SectionsKeysCubit>()
                      .getKey(index)
                      .currentContext!,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  curve: Curves.easeInOut,
                );
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  Navigator.of(context).pop();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
