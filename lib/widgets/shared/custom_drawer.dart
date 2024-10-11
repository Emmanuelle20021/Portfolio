import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/cubits/page_index_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(),
      child: BlocBuilder<PageIndexCubit, ScrollController>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: const Text('Sobre mi'),
                  onTap: () {
                    //state.animateToPage(
                    //  0,
                    //  duration: const Duration(milliseconds: 500),
                    //  curve: Curves.easeInOut,
                    //);
                  },
                ),
                ListTile(
                  title: const Text('Habilidades'),
                  onTap: () {
                    //state.animateToPage(
                    //  1,
                    //  duration: const Duration(milliseconds: 500),
                    //  curve: Curves.easeInOut,
                    //);
                  },
                ),
                ListTile(
                  title: const Text('Proyectos'),
                  onTap: () {
                    //state.animateToPage(
                    //  2,
                    //  duration: const Duration(milliseconds: 500),
                    //  curve: Curves.easeInOut,
                    //);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
