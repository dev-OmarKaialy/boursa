import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_boursa/core/extensions/context_extensions.dart';
import 'package:p_boursa/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:p_boursa/features/auth/presentation/pages/signup_screen.dart';

import '../../../../core/utils/toaster.dart';
import '../../../home/presentation/pages/HomePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == CubitStatus.loading) {
          Toaster.showLoading();
        } else {
          Toaster.closeLoading();
          if (state.status == CubitStatus.success) {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const HomePageScreen()),
                (r) {
              return false;
            });
          }
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/img/55.gif"),
          )),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Welcome Back.',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextField(
                      controller: emailController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        //contentPadding: EdgeInsets.symmetric(vertical: 60.0),
                        hintText: "Email Address",

                        hintStyle:
                            const TextStyle(fontSize: 15, color: Colors.white),
                        suffixIcon:
                            const Icon(Icons.email, color: Colors.lightBlue),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 5, 64, 113),
                                width: 1.0)),
                      ),
                      style:
                          TextStyle(color: context.theme.colorScheme.onPrimary),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: passwordController,
                      style:
                          TextStyle(color: context.theme.colorScheme.onPrimary),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        hintText: "Password",
                        hintStyle:
                            const TextStyle(fontSize: 15, color: Colors.white),
                        suffixIcon:
                            const Icon(Icons.lock, color: Colors.lightBlue),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 5, 64, 113),
                                width: 1.0)),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MaterialButton(
                        minWidth: double.infinity,
                        elevation: 5.0,
                        height: 60.0,
                        color: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 115),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        onPressed: () {
                          context.read<AuthBloc>().add(LoginEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                  context,
                                ) =>
                                        const signupScreen()));
                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.lightBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
