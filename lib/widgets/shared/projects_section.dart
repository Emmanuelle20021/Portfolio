import 'package:flutter/material.dart';
import 'package:portfolio/utils/double_to_gap.dart';

import '../../constants/constants.dart';

class Projects extends StatelessWidget {
  const Projects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1000,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Proyectos',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                // ISSUE: Decidir Si va o no el boton
                // OutlinedButton.icon(
                //   onPressed: () {},
                //   label: Text('Ver proyectos'),
                //   iconAlignment: IconAlignment.end,
                //   icon: Icon(
                //     Icons.arrow_outward_outlined,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: height * 0.8, // Limitar la altura de la sección
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 5,
                    height: height,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  AppSpacing.medium.toHorizontalGap,
                  Expanded(
                    // Expande el ListView para ocupar todo el espacio disponible
                    child: ListView(
                      shrinkWrap:
                          false, // Permite que el ListView ocupe todo el espacio
                      physics:
                          AlwaysScrollableScrollPhysics(), // Hacer que el ListView sea siempre desplazable
                      children: Constants.kProjects,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
