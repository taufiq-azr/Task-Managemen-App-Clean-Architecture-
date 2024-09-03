import 'package:flutter/material.dart';
import 'package:fullstack_taskmanagement/core/theme/app_palette.dart';
import 'package:fullstack_taskmanagement/features/Auth/domain/usecases/sign_in.dart';
import 'package:fullstack_taskmanagement/features/Auth/domain/usecases/sign_up.dart';
import 'package:fullstack_taskmanagement/presentation/pages/auth/signIn_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/auth_repository_impl.dart';
import 'presentation/bloc/auth/auth_bloc.dart';

void main() async {
  
  final authRepository = AuthRepositoryImpl();
  final signInUseCase = SignIn(repository: authRepository);
  final signUpUseCase = SignUp(repository: authRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(signInUseCase, signUpUseCase),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppPalette.backgroundPrimary),
        scaffoldBackgroundColor: AppPalette.backgroundPrimary,
        useMaterial3: true,
      ),
      home: const SignInPage(),
    );
  }
}
