import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'theme/rbs_theme.dart';

void main() {
  runApp(const NotentoolApp());
}

class NotentoolApp extends StatelessWidget {
  const NotentoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notentool',
      debugShowCheckedModeBanner: false,
      theme: RbsTheme.theme,        // 🔗 zentrales RBS-Theme
      home: const HomePage(),
    );
  }
}
