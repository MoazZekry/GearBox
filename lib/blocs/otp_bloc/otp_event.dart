abstract class OtpEvent {}

class SendOtpEvent extends OtpEvent {
  final String email;

  SendOtpEvent(this.email);
}

class VerifyOtpEvent extends OtpEvent {
  final String email;
  final String otp;

  VerifyOtpEvent(this.email, this.otp);
}
