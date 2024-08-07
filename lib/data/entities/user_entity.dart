import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String userId;
  final String email;
  final String name;
  final Map<int, int> cart;

  const MyUserEntity({
    required this.email,
    required this.name,
    required this.userId,
    this.cart = const {},
  });

  Map<String, Object?> toDocument() {
    return {
      "userId": userId,
      "email": email,
      "name": name,
      "cart": cart,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      email: doc["email"],
      name: doc["name"],
      userId: doc["userId"],
      cart: Map<int, int>.from(doc["cart"] ?? {}),
    );
  }

  @override
  List<Object?> get props => [userId, email, name, cart];
}
