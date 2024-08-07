import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/reset_password_bloc/reset_event.dart';
import 'package:gearbox3/blocs/reset_password_bloc/reset_state.dart';
import 'package:gearbox3/data/repositories/auth_rep.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository authRepository;

  ResetPasswordBloc(this.authRepository) : super(ResetPasswordInitial()) {
    on<ResetPasswordSubmit>(_onResetPasswordSubmit);
  }

  void _onResetPasswordSubmit(
      ResetPasswordSubmit event, Emitter<ResetPasswordState> emit) async {
    try {
      await authRepository.resetPassword(event.email, event.newPassword);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordError(e.toString()));
    }
  }
}
