class ResetPasswordEvent {}

class ResetPasswordSubmit extends ResetPasswordEvent {
  final String email;
  final String newPassword;

  ResetPasswordSubmit(this.email, this.newPassword);
}
