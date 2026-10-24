import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  final ValueNotifier<bool> _darkMode = ValueNotifier(false);

  @override
  void dispose() {
    _darkMode.dispose();
    super.dispose();
  }

  ThemeData _theme(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: brightness,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _darkMode,
      builder: (context, darkMode, child) {
        return MaterialApp(
          title: 'Little Counter',
          debugShowCheckedModeBanner: false,
          theme: _theme(Brightness.light),
          darkTheme: _theme(Brightness.dark),
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          home: HomeScreen(darkMode: _darkMode),
        );
      },
    );
  }
}
