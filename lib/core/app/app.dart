import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts/features/auth/data/repository/auth_repository.dart';
import 'package:ts/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ts/features/spalsh/presentation/pages/splash_screen.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = AuthService();
    return BlocProvider(
      create: (context) => AuthBloc(repository),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
