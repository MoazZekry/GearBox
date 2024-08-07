import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/blocs/cart_bloc/bloc.dart';
import 'package:gearbox3/blocs/otp_bloc/otp_bloc.dart';
import 'package:gearbox3/blocs/profile_bloc/profile_bloc.dart';
import 'package:gearbox3/blocs/reset_password_bloc/reset_bloc.dart';
import 'package:gearbox3/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:gearbox3/data/repositories/auth_rep.dart';
import 'package:gearbox3/data/repositories/user_repo.dart';
import 'package:gearbox3/screens/boardingscrren1.dart';
import 'package:gearbox3/screens/homescreenbase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Future.delayed(const Duration(seconds: 4));
  FlutterNativeSplash.remove();
  runApp(MyApp(AuthRepository()));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>.value(value: userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) =>
                AuthenticationBloc(userRepository: userRepository),
          ),
          BlocProvider<OtpBloc>(
            create: (context) => OtpBloc(userRepository as AuthRepository),
          ),
          BlocProvider<ResetPasswordBloc>(
            create: (context) =>
                ResetPasswordBloc(userRepository as AuthRepository),
          ),
          BlocProvider<CartBloc>(
              create: (context) => CartBloc(
                  userRepository: userRepository,
                  authenticationBloc: context.read<AuthenticationBloc>())),
          BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc(
                  userRepository: userRepository,
                  authenticationBloc: context.read<AuthenticationBloc>())),
        ],
        child: const MyAppView(),
      ),
    );
  }
}

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
