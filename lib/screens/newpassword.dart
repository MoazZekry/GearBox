import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/reset_password_bloc/reset_bloc.dart';
import 'package:gearbox3/blocs/reset_password_bloc/reset_event.dart';
import 'package:gearbox3/blocs/reset_password_bloc/reset_state.dart';
import 'package:gearbox3/data/global.dart';
import 'package:gearbox3/screens/login.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final TextEditingController newPasswordController =
            TextEditingController();
        final TextEditingController confirmPasswordController =
            TextEditingController();

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
          body: BlocListener<ResetPasswordBloc, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                Navigator.popUntil(context, ModalRoute.withName('/login'));
              } else if (state is ResetPasswordError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: Padding(
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
                                    builder: (context) => LogIn(),
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
                      "Forgot Password",
                      style: TextStyle(
                        color: Color.fromARGB(164, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 25,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).height / 50,
                        ),
                        const Text(
                          "New Password",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: newPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Enter your new password',
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
                      height: MediaQuery.sizeOf(context).height / 50,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).height / 50,
                        ),
                        const Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
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
                      height: MediaQuery.sizeOf(context).height / 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (newPasswordController.text ==
                            confirmPasswordController.text) {
                          BlocProvider.of<ResetPasswordBloc>(context).add(
                            ResetPasswordSubmit(
                                reset_email.text, newPasswordController.text),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Passwords do not match")),
                          );
                        }
                      },
                      child: Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size.fromHeight(50),
                          backgroundColor: Color.fromARGB(255, 248, 207, 0)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
