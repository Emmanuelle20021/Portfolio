import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';

class SharkBackgroundParallax extends StatefulWidget {
  const SharkBackgroundParallax({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SharkBackgroundParallax> createState() =>
      _SharkBackgroundParallaxState();
}

class _SharkBackgroundParallaxState extends State<SharkBackgroundParallax> {
  double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      setState(() {
        _offset = widget.scrollController.offset;
      });
    });
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
              child: SvgPicture.asset(
                Constants.kRockPath,
                width: constraints.maxWidth * 0.6,
                colorFilter: ColorFilter.mode(
                  AppColors.sharks,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.15,
              left: constraints.maxWidth * 0.15 + _offset,
              child: SvgPicture.asset(
                Constants.kSharkPath,
                width: constraints.maxWidth * 0.2,
                colorFilter: ColorFilter.mode(
                  AppColors.border,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0 + _offset * 0.7,
              child: SvgPicture.asset(
                Constants.kSharkPath,
                width: constraints.maxWidth * 0.2,
                colorFilter: ColorFilter.mode(
                  AppColors.border,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.3,
              left: 50 + _offset * 0.5,
              child: SvgPicture.asset(
                Constants.kSharkPath,
                width: constraints.maxWidth * 0.2,
                colorFilter: ColorFilter.mode(
                  AppColors.border,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: (constraints.minHeight * 0.2) * -1,
              child: SvgPicture.asset(
                Constants.kRockPath,
                width: constraints.maxWidth * 0.50,
                colorFilter: ColorFilter.mode(
                  AppColors.surface,
                  BlendMode.srcIn,
                ),
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
        (_) => SvgPicture.asset(
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
        (_) => SvgPicture.asset(
          Constants.kRockGroupPath,
          width: size.width * 0.5,
        ),
      ),
    );
  }
}
