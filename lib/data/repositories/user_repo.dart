import 'package:firebase_auth/firebase_auth.dart';
import 'package:gearbox3/data/user/user.dart';

abstract class UserRepository {
  Stream<User?> get user;
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> setUserData(MyUser user);
  Future<void> signIn(String email, String password);
  Future<void> logOut();
  Future<void> resetPassword(String email, String newPassword);
  Future<bool> verifyOtp(String email, String otp);
  Future<void> updateCart(String userId, Map<int, int> cart);
  Future<void> incrementProductInCart(String userId, int productId);
  Future<void> decrementProductInCart(String userId, int productId);
  Future<void> removeProductFromCart(String userId, int productId);
  Future<Map<int, int>> getCart(String userId);
  Future<void> clearCart(String userId);
  Future<void> updateUserProfile(String userName, String imageUrl);
}
