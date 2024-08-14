import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_boursa/core/extensions/context_extensions.dart';
import 'package:p_boursa/core/utils/toaster.dart';
import 'package:p_boursa/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:p_boursa/features/home/presentation/pages/HomePage.dart';
//import 'package:signup/detailsT.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailnameController = TextEditingController();
  TextEditingController passwordnameController = TextEditingController();
  TextEditingController confirmPasswordnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                  color: Colors.white,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 29,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
          body: PageView(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      "images/55.gif",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 540),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  Welcome",
                          style: TextStyle(color: Colors.white, fontSize: 41),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text("    Creat your account",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 230),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: firstnameController,
                            style: TextStyle(
                                color: context.theme.colorScheme.onPrimary),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(13),
                              hintText: "First Name",
                              hintStyle: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                              suffixIcon: const Icon(
                                Icons.person,
                                color: Colors.lightBlue,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(70),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0)),
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          TextField(
                            controller: lastnameController,
                            style: TextStyle(
                                color: context.theme.colorScheme.onPrimary),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(13),
                              hintText: "Last Name",
                              hintStyle: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                              suffixIcon: const Icon(Icons.person,
                                  color: Colors.lightBlue),
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
                            height: 13,
                          ),
                          TextField(
                            controller: emailnameController,
                            style: TextStyle(
                                color: context.theme.colorScheme.onPrimary),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(13),
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                              suffixIcon: const Icon(Icons.email,
                                  color: Colors.lightBlue),
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
                            height: 13,
                          ),
                          TextField(
                            controller: phoneController,
                            onChanged: (value) {},
                            style: TextStyle(
                                color: context.theme.colorScheme.onPrimary),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(13),
                              hintText: "Phone",
                              hintStyle: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                              suffixIcon: const Icon(Icons.email,
                                  color: Colors.lightBlue),
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
                            height: 13,
                          ),
                          TextField(
                            controller: passwordnameController,
                            onChanged: (value) {},
                            style: TextStyle(
                                color: context.theme.colorScheme.onPrimary),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(13),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                              suffixIcon: const Icon(Icons.lock,
                                  color: Colors.lightBlue),
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
                            height: 13,
                          ),
                          TextField(
                            onChanged: (value) {},
                            style: TextStyle(
                                color: context.theme.colorScheme.onPrimary),
                            controller: confirmPasswordnameController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(13),
                              hintText: "Confirm Password",
                              hintStyle: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                              suffixIcon: const Icon(Icons.lock,
                                  color: Colors.lightBlue),
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
                            height: 50,
                          ),
                          MaterialButton(
                              elevation: 5.0,
                              color: Colors.lightBlue,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 115),
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              onPressed: () {
                                context.read<AuthBloc>().add(RegisterEvent(
                                      first_Name: firstnameController.text,
                                      last_Name: lastnameController.text,
                                      email: emailnameController.text,
                                      phoneNumber: phoneController.text,
                                      password: passwordnameController.text,
                                      confirmPassword:
                                          confirmPasswordnameController.text,
                                    ));
                              },
                              child: const Text(
                                "REGISTER",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
