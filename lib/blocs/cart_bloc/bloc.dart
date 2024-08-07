import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/blocs/cart_bloc/event.dart';
import 'package:gearbox3/data/repositories/user_repo.dart';

class CartBloc extends Bloc<CartEvent, AuthenticationState> {
  final UserRepository userRepository;
  late StreamSubscription<AuthenticationState> _authenticationSubscription;

  CartBloc({
    required this.userRepository,
    required AuthenticationBloc authenticationBloc,
  }) : super(authenticationBloc.state) {
    // Subscribe to authentication state changes
    _authenticationSubscription = authenticationBloc.stream.listen((state) {
      if (state.status == AuthenticationStatues.authenticated) {
        // Refresh cart when user is authenticated
        add(FetchCart(state.user!.uid)); // Assuming UID is used as userId
      } else {
        // Clear cart when user is unauthenticated
        add(FetchCart('')); // Pass an empty string or handle as needed
      }
    });

    // Event handlers
    on<FetchCart>((event, emit) async {
      Map<int, int> cart = await userRepository.getCart(event.userId);

      emit(state.copyWith(cart: cart));
    });

    on<Clear>((event, emit) async {
      await userRepository.clearCart(event.userId);
      Map<int, int> cart = await userRepository.getCart(event.userId);

      emit(state.copyWith(cart: cart));
    });

    on<IncrementProductInCart>((event, emit) async {
      await userRepository.incrementProductInCart(
          event.userId, event.productId);
      Map<int, int> cart = await userRepository.getCart(event.userId);
      emit(state.copyWith(cart: cart));
    });

    on<DecrementProductInCart>((event, emit) async {
      await userRepository.decrementProductInCart(
          event.userId, event.productId);
      Map<int, int> cart = await userRepository.getCart(event.userId);
      emit(state.copyWith(cart: cart));
    });

    on<RemoveProductFromCart>((event, emit) async {
      await userRepository.removeProductFromCart(event.userId, event.productId);
      Map<int, int> cart = await userRepository.getCart(event.userId);
      emit(state.copyWith(cart: cart));
    });
  }

  @override
  Future<void> close() {
    _authenticationSubscription.cancel();
    return super.close();
  }
}
