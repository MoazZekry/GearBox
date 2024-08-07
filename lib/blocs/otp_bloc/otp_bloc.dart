import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/otp_bloc/otp_event.dart';
import 'package:gearbox3/blocs/otp_bloc/otp_state.dart';
import 'package:gearbox3/data/repositories/auth_rep.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository authRepository;

  OtpBloc(this.authRepository) : super(OtpInitial()) {
    on<SendOtpEvent>(_onSendOtpEvent);
    on<VerifyOtpEvent>(_onVerifyOtpEvent);
  }

  void _onSendOtpEvent(SendOtpEvent event, Emitter<OtpState> emit) async {
    try {
      await authRepository.sendOtp(event.email);
      emit(OtpSent());
    } catch (e) {
      emit(OtpError(e.toString()));
    }
  }

  void _onVerifyOtpEvent(VerifyOtpEvent event, Emitter<OtpState> emit) async {
    try {
      bool isValid = await authRepository.verifyOtp(event.email, event.otp);
      if (isValid) {
        emit(OtpVerified());
      } else {
        emit(OtpError("Invalid OTP"));
      }
    } catch (e) {
      emit(OtpError(e.toString()));
    }
  }
}
