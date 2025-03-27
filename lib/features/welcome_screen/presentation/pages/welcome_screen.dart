import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../cubit/welcome_cubit.dart';
import '../cubit/welcome_state.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late WelcomeCubit _welcomeCubit;

  @override
  void initState() {
    super.initState();
    _welcomeCubit = WelcomeCubit(this, vsync: this)..startAnimation(context);
  }

  @override
  void dispose() {
    _welcomeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _welcomeCubit,
      child: BlocBuilder<WelcomeCubit, WelcomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Positioned(
                  top: -320,
                  right: -350,
                  child: Container(
                    width: 820,
                    height: 820,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Color(0xFFFFDD00).withOpacity(0.5),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: FadeTransition(
                    opacity: state.fadeAnimation,
                    child: SlideTransition(
                      position: state.slideAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/90s_apps.svg',
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(height: 40),
                          SvgPicture.asset(
                            'assets/svgs/jadi_mudah.svg',
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
