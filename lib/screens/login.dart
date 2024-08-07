import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:gearbox3/data/global.dart';
import 'package:gearbox3/screens/boardingscreen2.dart';
import 'package:gearbox3/screens/forgotpassword.dart';
import 'package:gearbox3/screens/homescreenbase.dart';
import 'package:gearbox3/screens/signup.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository),
      child: Builder(
        builder: (context) => BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              screenIndex = 0;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreenBase(),
                ),
              );
            }
          },
          child: Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(30),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signup(),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have Account ? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      " Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 248, 207, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 25, 25, 25),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(9, 9, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BoardingScreenTwo(),
                                  ),
                                );
                              },
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Color.fromARGB(164, 255, 255, 255),
                                    size: 15,
                                  ),
                                  Text(
                                    "Back",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("images/splash.png"),
                            height: 110,
                          ),
                        ],
                      ),
                    ]),
                    const Text(
                      "Log In",
                      style: TextStyle(
                        color: Color.fromARGB(164, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 50,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 50,
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPassword(),
                              ),
                            );
                          },
                          child: const Text(
                            "Forget Password ?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    ElevatedButton(
                      onPressed: () {
                        context.read<SignInBloc>().add(SignInRequired(
                            emailController.text, passwordController.text));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor:
                              const Color.fromARGB(255, 248, 207, 0)),
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Or sign in with",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/Google.svg',
                          semanticsLabel: 'My SVG Image',
                          height: MediaQuery.of(context).size.height / 30,
                          width: MediaQuery.of(context).size.height / 30,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 25),
                        SvgPicture.asset(
                          'images/Facebook.svg',
                          semanticsLabel: 'My SVG Image',
                          height: MediaQuery.of(context).size.height / 30,
                          width: MediaQuery.of(context).size.height / 30,
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
