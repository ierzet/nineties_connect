import 'package:flutter/material.dart';

class WelcomeState {
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  WelcomeState({
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  WelcomeState copyWith({
    Animation<double>? fadeAnimation,
    Animation<Offset>? slideAnimation,
  }) {
    return WelcomeState(
      fadeAnimation: fadeAnimation ?? this.fadeAnimation,
      slideAnimation: slideAnimation ?? this.slideAnimation,
    );
  }
}
