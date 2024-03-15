import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/components/custom_filled_button.dart';
import '../../../../../core/components/divider_with_text.dart';
import '../../../../../core/components/outlined_text_form_field.dart';
import '../../../../resources/resources.dart';
import '../bloc/auth/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 450,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Welcome back!',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "We're so excited to see you again!",
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              OutlinedTextFormField(
                                controller: _emailController,
                                labelText: 'Email',
                              ),
                              const SizedBox(height: 28),
                              OutlinedTextFormField(
                                labelText: 'Password',
                                controller: _passwordController,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      context.pushNamed('forgotPassword');
                                    },
                                    child: const Text('Forgot Password?'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              CustomFilledButton(
                                text: 'Log In',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    BlocProvider.of<AuthBloc>(context).add(
                                      SignInEmailPasswordAuthEvent(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        context: context,
                                      ),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text("You don't have an account?"),
                                  TextButton(
                                    onPressed: () {
                                      context.pushNamed('signUp');
                                    },
                                    child: const Text('Sign Up'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              const DividerWithText(
                                text: 'Or continue with',
                              ),
                              const SizedBox(height: 35),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<AuthBloc>(context).add(
                                        SignInWithGoogleAuthEvent(
                                          context: context,
                                        ),
                                      );
                                    },
                                    icon: Image.asset(
                                      Images.google,
                                      height: 55,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<AuthBloc>(context).add(
                                        SignInWithAppleAuthEvent(
                                          context: context,
                                        ),
                                      );
                                    },
                                    icon: Image.asset(
                                      Images.apple,
                                      height: 55,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<AuthBloc>(context).add(
                                        SignInWithFacebookAuthEvent(
                                          context: context,
                                        ),
                                      );
                                    },
                                    icon: Image.asset(
                                      Images.facebook,
                                      height: 55,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
