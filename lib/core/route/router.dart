import 'view.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnBoardingPage(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthenticationPage(),
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
      GoRoute(path: '/main', builder: (context, state) => const MainScreen()),
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

      GoRoute(path: '/faq', builder: (context, state) => const FAQScreen()),
      GoRoute(
        path: '/payment',
        builder:
            (context, state) => BlocProvider(
              create: (context) => PaymentBloc(),
              child: const PaymentScreen(),
            ),
      ),
      GoRoute(
        path: '/about',
        builder:
            (context, state) => BlocProvider(
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
}
