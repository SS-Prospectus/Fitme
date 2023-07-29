import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitme/src/features/input_page.dart';
import 'package:fitme/src/features/result_page.dart';

class AppRouter{
  final goRouter = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'input',
          pageBuilder: (context, state) => MaterialPage(child: InputPage()),
        ),
        GoRoute(
          path: '/result',
          name: 'result',
          pageBuilder: (context, state) => MaterialPage(child: ResultPage()),
        ),
      ]
  );
}