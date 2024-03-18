import 'package:fl_resume/app/presentation/pages/home_page.dart';
import 'package:fl_resume/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ingedevs',
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}
