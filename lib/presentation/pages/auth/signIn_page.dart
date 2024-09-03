import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullstack_taskmanagement/core/theme/app_palette.dart';
import 'package:fullstack_taskmanagement/presentation/pages/auth/signup_page.dart';
import 'package:fullstack_taskmanagement/presentation/widgets/navigation_bar.dart';
import 'package:fullstack_taskmanagement/presentation/widgets/textfield.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/bloc_event.dart';
import '../../bloc/auth/bloc_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const NavigationBarBasic()),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Sign In.',
                      style: TextStyle(
                        fontSize: 40,
                        color: AppPalette.fontColorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  AuthTextField(
                    textFieldController: _emailController,
                    iconTextField: Icons.email,
                    labelTextField: 'Email',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AuthTextField(
                    textFieldController: _passwordController,
                    obscureTextValue: true,
                    iconTextField: Icons.password_sharp,
                    labelTextField: 'Password',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an Account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: HexColor("#090A0A"),
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              fontSize: 14,
                              color: HexColor("#090A0A"),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 150.0,
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
                            SignInEvent(
                                email: _emailController.text,
                                password: _passwordController.text),
                          );
                    },
                    child: const Text("Sign In"),
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
