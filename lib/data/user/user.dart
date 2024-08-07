import 'package:equatable/equatable.dart';
import 'package:gearbox3/data/entities/user_entity.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  final String name;
  final Map<int, int> cart;

  const MyUser({
    required this.email,
    required this.name,
    required this.userId,
    this.cart = const {},
  });

  static const empty = MyUser(email: "", name: "", userId: "");

  MyUser copyWith({
    String? userId,
    String? email,
    String? name,
    Map<int, int>? cart,
  }) {
    return MyUser(
      email: email ?? this.email,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      cart: cart ?? this.cart,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      email: email,
      name: name,
      userId: userId,
      cart: cart,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      email: entity.email,
      name: entity.name,
      userId: entity.userId,
      cart: entity.cart,
    );
  }

  @override
  List<Object?> get props => [userId, email, name, cart];
}
