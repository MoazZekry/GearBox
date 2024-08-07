import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:gearbox3/data/user/user.dart';
import 'package:gearbox3/screens/homescreenbase.dart';
import 'package:gearbox3/screens/login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmpasswordController =
        TextEditingController();

    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreenBase(),
                ));
          } else if (state is SignUpProcess) {
            // Handle sign-up process
          } else if (state is SignUpFailure) {
            // Handle sign-up failure
          }
        },
        child: Builder(builder: (context) {
          return Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(30),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogIn(),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have Account ? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      " Login",
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
                                    builder: (context) => const LogIn(),
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
                      "Create new account",
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 50,
                        ),
                        const Text(
                          "Confirm password",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: confirmpasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm your password',
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
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    ElevatedButton(
                      onPressed: () {
                        if (passwordController.text ==
                            confirmpasswordController.text) {
                          MyUser myUser = MyUser.empty;
                          myUser = myUser.copyWith(email: emailController.text);
                          context.read<SignUpBloc>().add(
                              SignUpRequird(myUser, passwordController.text));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor:
                              const Color.fromARGB(255, 248, 207, 0)),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
