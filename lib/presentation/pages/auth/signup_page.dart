import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullstack_taskmanagement/core/theme/app_palette.dart';
import 'package:fullstack_taskmanagement/presentation/widgets/textfield.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/bloc_event.dart';
import '../../bloc/auth/bloc_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Akun gagal dibuat!')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Sign Up.',
                      style: TextStyle(
                        fontSize: 40,
                        color: AppPalette.fontColorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AuthTextField(
                    textFieldController: _nameController,
                    iconTextField: Icons.person,
                    labelTextField: 'Name',
                  ),
                  AuthTextField(
                    textFieldController: _emailController,
                    iconTextField: Icons.email,
                    labelTextField: 'Email',
                  ),
                  AuthTextField(
                    textFieldController: _passwordController,
                    obscureTextValue: true,
                    iconTextField: Icons.password_sharp,
                    labelTextField: 'Password',
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(170, 48),
                      backgroundColor: AppPalette.buttonColorPrimary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            SignUpEvent(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text),
                          );
                    },
                    child: const Text("Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
