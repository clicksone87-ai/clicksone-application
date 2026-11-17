import 'package:go_router/go_router.dart';
import '../../screens/auth/forgot_password_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/launch/launch_screen.dart';
import '../../screens/messages/messages_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/services/services_screen.dart';
import '../widgets/bottom_nav_shell.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.launch,
  routes: [
    GoRoute(
        path: AppRoutes.launch,
        builder: (context, state) => const LaunchScreen()),
    GoRoute(
      path: AppRoutes.login,
      // extra == true opens the Sign Up tab
      builder: (context, state) => LoginScreen(startOnSignUp: state.extra == true),
    ),
    GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => BottomNavShell(navigationShell: shell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: AppRoutes.home, builder: (context, state) => const HomeScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: AppRoutes.services, builder: (context, state) => const ServicesScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: AppRoutes.messages, builder: (context, state) => const MessagesScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: AppRoutes.profile, builder: (context, state) => const ProfileScreen()),
        ]),
      ],
    ),
  ],
);
