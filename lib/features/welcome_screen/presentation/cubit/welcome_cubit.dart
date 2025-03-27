import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nineties_connect/features/onboarding/presentation/pages/onboarding_page.dart';
import 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  late AnimationController _controller;
  bool _isDisposed = false;

  WelcomeCubit(_welcomeScreenState, {required TickerProvider vsync})
      : super(WelcomeState(
          fadeAnimation: AlwaysStoppedAnimation(0.0),
          slideAnimation: AlwaysStoppedAnimation(Offset(0, 0.5)),
        )) {
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: vsync,
    );

    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    final slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    _controller.forward();

    emit(state.copyWith(fadeAnimation: fadeAnimation, slideAnimation: slideAnimation));
  }

  void startAnimation(BuildContext context) {
    if (!_isDisposed) {
      _controller.forward().then((_) {
        if (!_isDisposed) {
          navigateToLanding(context);
        }
      });
    }
  }

  void navigateToLanding(BuildContext context) {
    if (!_isDisposed) {
      Future.delayed(Duration(seconds: 2), () {
        print('One second has passed.'); 
        if (!_isDisposed) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const OnBoardingPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              transitionDuration: Duration(milliseconds: 800),
            ),
          );
        }
      });
    }
  }

  @override
  Future<void> close() {
    _isDisposed = true;
    _controller.dispose();
    return super.close();
  }
}
