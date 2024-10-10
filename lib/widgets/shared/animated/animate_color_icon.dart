import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/theme_cubit.dart';

class AnimateColorIcon extends StatefulWidget {
  const AnimateColorIcon({
    super.key,
    this.startColor = Colors.black,
    this.endColor = Colors.white,
    required this.icon,
  });
  final Color startColor;
  final Color endColor;
  final IconData icon;
  @override
  State<AnimateColorIcon> createState() => _AnimateColorIconState();
}

class _AnimateColorIconState extends State<AnimateColorIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  void _changeColor() {
    // Inicia o revierte la animación
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    context.read<ThemeCubit>().toggleTheme();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 500,
      ), // Duración de la animación
      vsync: this,
    );

    // Define la animación del color
    _colorAnimation = ColorTween(
      begin: widget.startColor, // Color inicial
      end: widget.endColor, // Color final
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (__, _) {
        return IconButton(
          icon: Icon(widget.icon),
          color: _colorAnimation.value,
          onPressed: _changeColor,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera el controlador
    super.dispose();
  }
}
