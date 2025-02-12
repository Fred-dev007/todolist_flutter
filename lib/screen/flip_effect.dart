import 'dart:math' as math;
import 'package:flutter/material.dart';

class CardFlipButton extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const CardFlipButton({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<CardFlipButton> createState() => _CardFlipButtonState();
}

class _CardFlipButtonState extends State<CardFlipButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _flipCard() {
    if (_animationController.isCompleted || _animationController.isAnimating) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard, // Déclenche l'animation au clic
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateY(_animation.value * math.pi),
            child: _animation.value > 0.5
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(math.pi),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Cliqué !",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  )
                : widget.child,
          );
        },
      ),
    );
  }
}
