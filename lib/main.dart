import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/account/presentation/pages/profile_screen.dart';
import 'package:nineties_connect/features/account_about/presentation/cubit/about_cubit.dart';
import 'package:nineties_connect/features/account_about/presentation/pages/about_screen.dart';
import 'package:nineties_connect/features/account_faq/presentation/pages/faq_screen.dart';
import 'package:nineties_connect/features/account_payment/presentation/bloc/payment_bloc.dart';
import 'package:nineties_connect/features/account_payment/presentation/pages/payment_screen.dart';
import 'package:nineties_connect/features/activity/presentation/pages/%20activity_screen.dart';
import 'package:nineties_connect/features/authentication/presentation/pages/authentication_page.dart';
import 'package:nineties_connect/features/authentication/presentation/pages/signup_page.dart';
import 'package:nineties_connect/features/detail_activity/presentation/pages/detail_screen.dart';
import 'package:nineties_connect/features/gallery/presentation/pages/gallery_screen.dart';
import 'package:nineties_connect/features/home/presentation/pages/home_page.dart';
import 'package:nineties_connect/features/logout/presentation/pages/logout_dialog.dart';
import 'package:nineties_connect/features/main/presentation/pages/main_screen.dart';
import 'package:nineties_connect/features/maintenance/presentation/pages/maintenance_screen.dart';
import 'package:nineties_connect/features/membership/presentation/pages/membership_screen.dart';
import 'package:nineties_connect/features/membership_info/presentation/pages/vehicle_info_screen.dart';
import 'package:nineties_connect/features/membership_informasion/presentation/pages/membership_info_screen.dart';
import 'package:nineties_connect/features/notifications/presentation/pages/notification_page.dart';
import 'package:nineties_connect/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:nineties_connect/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:nineties_connect/features/outlet_location/presentation/pages/outlet_location_screen.dart';
import 'package:nineties_connect/features/vehicle_type/presentation/bloc/vehicle_type_bloc.dart';
import 'package:nineties_connect/features/vehicle_type/presentation/bloc/vehicle_type_event.dart';
import 'package:nineties_connect/features/vehicle_type/presentation/pages/vehicle_type_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: MaterialApp.router(
        title: 'Flutter Template',
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => BlocProvider(
        create: (_) => OnboardingCubit(),
        child: const OnBoardingPage(),
      ),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthenticationPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const NotificationPage(),
    ),  
    GoRoute(
      path: '/logout',
      builder: (context, state) => const LogoutDialog(),
    ),


    // Activity
    GoRoute(
      path: '/activity',
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => const DetailScreen(),
      ),
    
    
    // Account

    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    
    GoRoute(
      path: '/faq',
      builder: (context, state) => const FAQScreen(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => BlocProvider(
        create: (context) => PaymentBloc(),
        child: const PaymentScreen(),
      ),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => BlocProvider(
        create: (_) => AboutCubit(),
        child: const AboutScreen(),
      ),
    ),


    // Maintenance
    GoRoute(
      path: '/maintenance',
      builder: (context, state) => const MaintenanceScreen(),
    ),

    // Outlet Location
    GoRoute(
      path: '/outlet-location',
      builder: (context, state) => OutletLocationScreen(),
    ),

    // Membership
    GoRoute(
      path: '/membership',
      builder: (context, state) => const MembershipScreen(),
    ),
    GoRoute(
      path: '/vehicle-info',
      builder: (context, state) => const VehicleInfoScreen(),
    ),
    GoRoute(
      path: '/membership-info',
      builder: (context, state) => const MembershipInfoScreen(),
    ),
    GoRoute(
      path: '/vehicle-type',
      builder: (context, state) => const VehicleTypeScreen(),
    ),  
GoRoute(
        path: '/',
        builder: (context, state) => const VehicleInfoScreen(),
      ),

    GoRoute(
      path: '/gallery',
      builder: (context, state) => const GalleryScreen(),
    ),
  ],
);
