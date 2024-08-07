import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';

import 'package:gearbox3/blocs/profile_bloc/profile_event.dart';
import 'package:gearbox3/data/repositories/user_repo.dart';

class ProfileBloc extends Bloc<ProfileEvent, AuthenticationState> {
  final UserRepository userRepository;
  late StreamSubscription<AuthenticationState> _authenticationSubscription;

  ProfileBloc({
    required this.userRepository,
    required AuthenticationBloc authenticationBloc,
  }) : super(authenticationBloc.state) {
    // Subscribe to authentication state changes
    _authenticationSubscription = authenticationBloc.stream.listen((state) {});

    // Event handlers
    on<UpdateProfile>((event, emit) async {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await userRepository.updateUserProfile(
          event.userName,
          event.imageUrl,
        );
        emit;
      } else {
        throw Exception('No user is currently signed in.');
      }
    });

    @override
    Future<void> close() {
      _authenticationSubscription.cancel();
      return super.close();
    }
  }
}
