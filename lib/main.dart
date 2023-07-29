import 'package:flutter/material.dart';
import 'package:fitme/src/routing/approuter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: BMICalculator()));

class BMICalculator extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
            color: Color(0xFF0A0E21)
        ),
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      routerConfig: AppRouter().goRouter,
    );
  }
}
