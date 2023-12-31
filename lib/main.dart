import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_fic9/presentation/auth/bloc/login/login_bloc_bloc.dart';
import 'package:flutter_ecommerce_fic9/presentation/auth/bloc/register/register_bloc.dart';

import 'presentation/auth/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBlocBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Ecommerce - Fikri Zufri',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
