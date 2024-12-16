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
              ],
            ),
            Row(
              children: [
                // Línea vertical
                Container(
                  width: 5, // Ancho de la línea
                  height:
                      height * .8, // Altura relativa, ajustable según necesidad
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                AppSpacing.medium.toHorizontalGap,
                Expanded(
                  child: ListView(
                    shrinkWrap:
                        true, // Permite que el ListView ocupe todo el espacio
                    physics:
                        NeverScrollableScrollPhysics(), // Evita el desplazamiento
                    children: Constants.kProjects,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
