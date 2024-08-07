part of 'authentication_bloc.dart';

enum AuthenticationStatues { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatues status;
  final User? user;
  final Map<int, int> cart;

  const AuthenticationState._({
    this.status = AuthenticationStatues.unknown,
    this.user,
    this.cart = const {},
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user,
      {Map<int, int> cart = const {}})
      : this._(
            status: AuthenticationStatues.authenticated,
            user: user,
            cart: cart);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatues.unauthenticated);

  AuthenticationState copyWith({
    AuthenticationStatues? status,
    User? user,
    Map<int, int>? cart,
  }) {
    return AuthenticationState._(
      status: status ?? this.status,
      user: user ?? this.user,
      cart: cart ?? this.cart,
    );
  }

  @override
  List<Object?> get props => [status, user, cart];
}
