import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/klassen_screen.dart';
import 'screens/faecher_screen.dart';
import 'core/theme/rbs_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
    debugPrint('Run `flutterfire configure` to set up Firebase');
  }

  runApp(const ProviderScope(child: InduScoreApp()));
}

// Router configuration with auth redirect
final _router = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    // This will be enhanced with auth state checking
    return null;
  },
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/klassen',
      builder: (context, state) => const KlassenScreen(),
    ),
    GoRoute(
      path: '/faecher',
      builder: (context, state) => const FaecherScreen(),
    ),
  ],
);

class InduScoreApp extends StatelessWidget {
  const InduScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'InduScore',
      debugShowCheckedModeBanner: false,
      theme: RBSTheme.lightTheme(), // RBS Styleguide Theme
      themeMode: ThemeMode.light,
      routerConfig: _router,
    );
  }
}
