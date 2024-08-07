import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/otp_bloc/otp_bloc.dart';
import 'package:gearbox3/blocs/otp_bloc/otp_event.dart';
import 'package:gearbox3/blocs/otp_bloc/otp_state.dart';
import 'package:gearbox3/data/global.dart';
import 'package:gearbox3/screens/login.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
          body: BlocListener<OtpBloc, OtpState>(
            listener: (context, state) {
              if (state is OtpSent) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogIn(),
                  ),
                );
              } else if (state is OtpError) {
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
                          "Your Email",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: reset_email,
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
                      height: MediaQuery.sizeOf(context).height / 35,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<OtpBloc>(context)
                            .add(SendOtpEvent(reset_email.text));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor:
                              const Color.fromARGB(255, 248, 207, 0)),
                      child: const Text(
                        "Send Reset Email",
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
          ),
        );
      },
    );
  }
}
