// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:nineties_connect/features/authentication/presentation/pages/authentication_page.dart';
// import 'package:nineties_connect/features/home/presentation/pages/home_page.dart';
// import 'package:nineties_connect/features/onboarding/presentation/cubit/onboarding_cubit.dart';
// import 'package:nineties_connect/features/onboarding/presentation/pages/onboarding_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => OnboardingCubit(),
//       child: MaterialApp.router(
//         title: 'Flutter Template',
//         routerConfig: _router,
//       ),
//     );
//   }
// }

// final GoRouter _router = GoRouter(
//   initialLocation: '/onboarding',
//   routes: [
//     GoRoute(
//       path: '/onboarding',
//       builder: (context, state) => BlocProvider(
//         create: (_) => OnboardingCubit(),
//         child: const OnBoardingPage(),
//       ),
//     ),
//     GoRoute(
//       path: '/auth',
//       builder: (context, state) => const AuthenticationPage(),
//     ),
//     GoRoute(
//       path: '/home',
//       builder: (context, state) => const HomeScreen(),
//     ),
//   ],
// );



// class OnBoardingPage extends StatelessWidget {
//   const OnBoardingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     PageController pageController = PageController(initialPage: 0);

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           PageView(
//             controller: pageController,
//             onPageChanged: (index) {
//               context.read<OnboardingCubit>().indicatorState(index);
//             },
//             children: [
//               OnboardingPageView(
//                 page: 0,
//                 title: 'Selamat Datang di\n 90s Super App',
//                 subtitle:
//                     'Rasakan kemudahan merawat\n kendaraan dalam satu genggaman',
//                 svgPath: 'assets/svgs/nineties-thunder.svg',
//               ),
//               OnboardingPageView(
//                 page: 1,
//                 title: 'Cuci Sepuasnya\n dengan Membership',
//                 subtitle: 'Daftrakan kendaraanmu agar selalu\n terlindungi',
//                 svgPath: 'assets/svgs/membercard.svg',
//               ),
//               OnboardingPageView(
//                 page: 2,
//                 title: 'Jadilah yang Pertama',
//                 subtitle:
//                     'Aplikasi otomotif pertama untuk\n pelanggan 90s Autoworks',
//                 svgPath: 'assets/svgs/Maskot 90s.svg',
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 235,
//             child: OnBoardingThreeDots(),
//           ),
//           Positioned(
//             bottom: 175,
//             child: OnBoardingButton(),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class OnBoardingButton extends StatelessWidget {
//   const OnBoardingButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 192,
//       height: 48,
//       child: BlocBuilder<OnboardingCubit, OnboardingState>(
//         builder: (context, state) {
//           return ElevatedButton(
//             onPressed: () {
//               // if (page == 3) {
//               //   context.go('/auth');
//               // } else {
//               //   context.read<OnboardingCubit>().nextPage();
//               // }
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFFFDD00),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(999),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
//             ),
//             child: Text(
//               state.page==0? 'Start':'Next',
//               style: TextStyle(
//                 fontFamily: 'Inter',
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 height: 24 / 16,
//                 letterSpacing: 0,
//                 color: Color(0xFF010101),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class OnboardingCubit extends Cubit<OnboardingState> {
//   OnboardingCubit() : super(OnboardingState(page: 0));

//   void indicatorState(int index) {
//     emit(OnboardingState(page: index));
//   }
// }

// class OnboardingPageView extends StatelessWidget {
//   final int page;
//   final String title;
//   final String subtitle;
//   final String svgPath;

//   const OnboardingPageView({
//     super.key,
//     required this.page,
//     required this.title,
//     required this.subtitle,
//     required this.svgPath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 svgPath,
//                 width: 375,
//                 height: 451,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontFamily: 'Inter',
//                   fontSize: 28,
//                   fontWeight: FontWeight.w700,
//                   height: 40 / 28,
//                   letterSpacing: 0,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 subtitle,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontFamily: 'Inter',
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   height: 24 / 16,
//                   letterSpacing: 0,
//                   color: Color(0xFFA0A0A0),
//                 ),
//               ),
              
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
