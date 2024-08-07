import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:gearbox3/data/global.dart';
import 'package:gearbox3/screens/boardingscrren1.dart';
import 'package:gearbox3/screens/homescreenbase.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        print(state.status);
        if (state.status == AuthenticationStatues.authenticated) {
          screenIndex = 0;
          return BlocProvider(
              create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: const HomeScreenBase());
        } else {
          return const BoardingScreenOne();
        }
      }),
    );
  }
}
