import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Para kIsWeb

import '../../constants/constants.dart';

class SharkBackgroundParallax extends StatefulWidget {
  const SharkBackgroundParallax({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SharkBackgroundParallax> createState() =>
      _SharkBackgroundParallaxState();
}

class _SharkBackgroundParallaxState extends State<SharkBackgroundParallax> {
  double getParallaxOffset(double offset) {
    // Si es Web, se aumenta el efecto de desplazamiento para hacerlo más visible
    return kIsWeb
        ? offset * 0.5
        : offset * 0.2; // Cambia el factor según la plataforma
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned(
              left: 0,
              bottom: (constraints.minHeight * 0.2) * -1,
              child: Image.asset(
                Constants.kRockPath,
                width: constraints.maxWidth * 0.6,
                color: AppColors.sharks,
              ),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.15,
              left: constraints.maxWidth * 0.15,
              child: AnimatedBuilder(
                animation: widget.scrollController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                        getParallaxOffset(widget.scrollController.offset), 0),
                    child: child,
                  );
                },
                child: Image.asset(
                  Constants.kSharkPath,
                  width: constraints.maxWidth * 0.2,
                  color: AppColors.border,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: AnimatedBuilder(
                animation: widget.scrollController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                        getParallaxOffset(widget.scrollController.offset) * 1.5,
                        0),
                    child: child,
                  );
                },
                child: Image.asset(
                  Constants.kSharkPath,
                  width: constraints.maxWidth * 0.2,
                  color: AppColors.border,
                ),
              ),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.3,
              left: 50,
              child: AnimatedBuilder(
                animation: widget.scrollController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                        getParallaxOffset(widget.scrollController.offset), 0),
                    child: child,
                  );
                },
                child: Image.asset(
                  Constants.kSharkPath,
                  width: constraints.maxWidth * 0.2,
                  color: AppColors.border,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: (constraints.minHeight * 0.2) * -1,
              child: Image.asset(
                Constants.kRockPath,
                width: constraints.maxWidth * 0.50,
                color: AppColors.surface,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: KelpGroup(),
            ),
            Positioned(
              right: 0,
              bottom: -10,
              child: RockGroup(),
            ),
          ],
        );
      },
    );
  }
}

class KelpGroup extends StatelessWidget {
  const KelpGroup({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        2,
        (_) => Image.asset(
          Constants.kKelpGroupPath,
          width: size.width * 0.5,
        ),
      ),
    );
  }
}

class RockGroup extends StatelessWidget {
  const RockGroup({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        2,
        (_) => Image.asset(
          Constants.kRockGroupPath,
          width: size.width * 0.5,
        ),
      ),
    );
  }
}
