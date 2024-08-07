import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gearbox3/data/repositories/user_repo.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInProcess());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SignInSuccess());
      } on FirebaseAuthException catch (e) {
        emit(SignInfailure(message: e.code));
      } catch (e) {
        emit(const SignInfailure());
      }
    });
    on<SignOutRequird>((event, emit) async {
      await _userRepository.logOut();
    });
  }
}
