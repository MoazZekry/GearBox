import 'package:equatable/equatable.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class IncrementProductInCart extends CartEvent {
  final String userId;
  final int productId;

  const IncrementProductInCart(this.userId, this.productId);
}

class DecrementProductInCart extends CartEvent {
  final String userId;
  final int productId;

  const DecrementProductInCart(this.userId, this.productId);
}

class RemoveProductFromCart extends CartEvent {
  final String userId;
  final int productId;

  const RemoveProductFromCart(this.userId, this.productId);
}

class FetchCart extends CartEvent {
  final String userId;

  const FetchCart(this.userId);
}

class Clear extends CartEvent {
  final String userId;

  const Clear(this.userId);
}
