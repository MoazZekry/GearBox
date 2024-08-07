part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequird extends SignUpEvent {
  final MyUser user;
  final String paswword;

  const SignUpRequird(this.user, this.paswword);
}
