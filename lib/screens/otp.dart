import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/otp_bloc/otp_bloc.dart';
import 'package:gearbox3/blocs/otp_bloc/otp_event.dart';
import 'package:gearbox3/blocs/otp_bloc/otp_state.dart';
import 'package:gearbox3/data/global.dart';
import 'package:gearbox3/screens/login.dart';
import 'package:gearbox3/screens/newpassword.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final TextEditingController OTP = TextEditingController();
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
          body: BlocListener<OtpBloc, OtpState>(
            listener: (context, state) {
              if (state is OtpVerified) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPassword(),
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
                      "OTP",
                      style: TextStyle(
                        color: Color.fromARGB(164, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                    const Text(
                      "Please Enter OTP",
                      style: TextStyle(
                        color: Color.fromARGB(164, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 25,
                    ),
                    Pinput(
                      onCompleted: (value) {
                        OTP.text = value;
                        print(OTP.text);
                      },
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: PinTheme(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 25),
                          height: MediaQuery.sizeOf(context).height / 8,
                          width: MediaQuery.sizeOf(context).height / 8,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black54,
                                    spreadRadius: 0,
                                    blurRadius: 3,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset(0, 6))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 36, 36, 36))),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<OtpBloc>(context)
                            .add(VerifyOtpEvent(reset_email.text, OTP.text));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor:
                              const Color.fromARGB(255, 248, 207, 0)),
                      child: const Text(
                        "Verify",
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
