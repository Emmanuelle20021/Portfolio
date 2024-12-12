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
        minHeight: height * 0.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              height: height,
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
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
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
