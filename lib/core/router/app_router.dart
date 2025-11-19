import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/classes/presentation/pages/class_detail_page.dart';
import '../../features/classes/presentation/pages/classes_page.dart';
import '../../features/assessments/presentation/pages/assessments_page.dart';
import '../../features/makeups/presentation/pages/makeups_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../providers/firebase_providers.dart';

/// Application routes
class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String classes = '/classes';
  static const String classDetail = '/classes/:id';
  static const String assessments = '/assessments';
  static const String makeups = '/makeups';
  static const String settings = '/settings';
}

/// Router provider
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: AppRoutes.login,
    redirect: (context, state) {
      final isAuthenticated = authState.maybeWhen(
        data: (user) => user != null,
        orElse: () => false,
      );

      final isLoginRoute = state.matchedLocation == AppRoutes.login;

      // Redirect to login if not authenticated and not already on login page
      if (!isAuthenticated && !isLoginRoute) {
        return AppRoutes.login;
      }

      // Redirect to dashboard if authenticated and on login page
      if (isAuthenticated && isLoginRoute) {
        return AppRoutes.dashboard;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: AppRoutes.classes,
        builder: (context, state) => const ClassesPage(),
      ),
      GoRoute(
        path: AppRoutes.classDetail,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return ClassDetailPage(classId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.assessments,
        builder: (context, state) => const AssessmentsPage(),
      ),
      GoRoute(
        path: AppRoutes.makeups,
        builder: (context, state) => const MakeupsPage(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
});

/// Placeholder pages (will be replaced with actual implementations)

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Center(
        child: Text('Login Page - To be implemented'),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.class_),
            onPressed: () => context.go(AppRoutes.classes),
            tooltip: 'Classes',
          ),
          IconButton(
            icon: const Icon(Icons.assessment),
            onPressed: () => context.go(AppRoutes.assessments),
            tooltip: 'Assessments',
          ),
          IconButton(
            icon: const Icon(Icons.edit_note),
            onPressed: () => context.go(AppRoutes.makeups),
            tooltip: 'Makeups',
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.go(AppRoutes.settings),
            tooltip: 'Settings',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Notentool',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.classes),
              child: const Text('Go to Classes'),
            ),
          ],
        ),
      ),
    );
  }
}
