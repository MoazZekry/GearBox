import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/screens/setting.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: const Color.fromARGB(255, 248, 207, 0),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width / 4.5,
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 3,
                    child: const CircleAvatar(
                      radius: 70,
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FirebaseAuth.instance.currentUser?.displayName ?? "name",
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(
                  FirebaseAuth.instance.currentUser!.email!,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.settings,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50,
                        ),
                        const Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<AuthenticationBloc>()
                          .add(AuthenticationLogoutRequested());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.logout,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50,
                        ),
                        const Text(
                          "Log Out",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
