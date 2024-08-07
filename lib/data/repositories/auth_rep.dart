import 'dart:developer' as d;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gearbox3/data/repositories/user_repo.dart';
import 'package:gearbox3/data/user/user.dart';

class AuthRepository implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  final userCollection = FirebaseFirestore.instance.collection("user");

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);
      myUser = myUser.copyWith(userId: user.user!.uid);
      return myUser;
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser myUser) async {
    try {
      await userCollection
          .doc(myUser.userId)
          .set(myUser.toEntity().toDocument());
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> sendOtp(String email) async {
    try {
      //String otp = (Random().nextInt(9000) + 1000).toString();

      // await userCollection.doc(email).update({
      //   'otp': otp,
      //   'timestamp': FieldValue.serverTimestamp(),
      // });
      // Send OTP to user's email
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );

      // Map<String, dynamic> templateParams = {
      //   'user_subject': 'OTP',
      //   'user_message': otp,
      //   "to": email
      // };

      // try {
      //   await emailjs.send(
      //     'service_7ohy3ro',
      //     'template_bpj05u4',
      //     templateParams,
      //     const emailjs.Options(
      //       publicKey: '3OlY73vpOu5lnstbZ',
      //       privateKey: 'Li_g250scQ7TC0zDacgdc',
      //     ),
      //   );
      //   print('SUCCESS!');
      // } catch (error) {
      //   print('$error');
      // }

      // String username = 'flutter.projectss@gmail.com';
      // String password = 'red@27007447';

      // final smtpServer = gmail(username, password);

      // final message = Message()
      //   ..from = Address(username, 'Your App Name')
      //   ..recipients.add(email)
      //   ..subject = 'Your OTP Code'
      //   ..text = 'Your OTP code is $otp';

      // try {
      //   final sendReport = await send(message, smtpServer);
      //   print('Message sent: ' + sendReport.toString());
      // } on MailerException catch (e) {
      //   print('Message not sent.');
      //   for (var p in e.problems) {
      //     print('Problem: ${p.code}: ${p.msg}');
      //   }
      // }
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> verifyOtp(String email, String otp) async {
    try {
      DocumentSnapshot doc = await userCollection.doc(email).get();
      if (doc.exists) {
        String storedOtp = doc['otp'];
        Timestamp timestamp = doc['timestamp'];
        print(email);
        print(otp);

        print(storedOtp);
        print(timestamp);
        if (storedOtp == otp &&
            timestamp
                .toDate()
                .add(const Duration(minutes: 5))
                .isAfter(DateTime.now())) {
          return true;
        }
      }
      return false;
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email, String newPassword) async {
    try {
      // Check if the email has any associated sign-in methods
      List<String> signInMethods =
          await _firebaseAuth.fetchSignInMethodsForEmail(email);

      if (signInMethods.isNotEmpty) {
        // If there are sign-in methods, sign in with email and password
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: newPassword);

        // After signing in, update the password
        User? user = _firebaseAuth.currentUser;
        if (user != null) {
          await user.updatePassword(newPassword);
        } else {
          throw FirebaseAuthException(
            code: 'user-not-found',
            message: 'No user found for that email.',
          );
        }
      } else {
        throw FirebaseAuthException(
          code: 'email-not-found',
          message:
              'No user found for that email or user has no sign-in methods.',
        );
      }
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateCart(String userId, Map<int, int> cart) async {
    try {
      Map<String, int> cartStringKeys =
          cart.map((key, value) => MapEntry(key.toString(), value));

      await userCollection.doc(userId).update({'cart': cartStringKeys});
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> incrementProductInCart(String userId, int productId) async {
    try {
      DocumentSnapshot doc = await userCollection.doc(userId).get();

      if (doc.exists) {
        Map<int, int> cart = (doc['cart'] as Map).map((key, value) =>
            MapEntry(int.parse(key.toString()), int.parse(value.toString())));

        if (cart.containsKey(productId)) {
          cart[productId] = (cart[productId] ?? 0) + 1;

          await updateCart(userId, cart);
        } else {
          cart[productId] = 1;
          await updateCart(userId, cart);
        }
      }
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> decrementProductInCart(String userId, int productId) async {
    try {
      DocumentSnapshot doc = await userCollection.doc(userId).get();
      if (doc.exists) {
        Map<int, int> cart = (doc['cart'] as Map).map((key, value) =>
            MapEntry(int.parse(key.toString()), int.parse(value.toString())));
        if (cart.containsKey(productId)) {
          cart[productId] = cart[productId]! - 1;
          if (cart[productId]! <= 0) {
            cart.remove(productId);
          }
          await updateCart(userId, cart);
        }
      }
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> removeProductFromCart(String userId, int productId) async {
    try {
      DocumentSnapshot doc = await userCollection.doc(userId).get();
      if (doc.exists) {
        Map<int, int> cart = (doc['cart'] as Map).map((key, value) =>
            MapEntry(int.parse(key.toString()), int.parse(value.toString())));
        cart.remove(productId);
        await updateCart(userId, cart);
      }
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> clearCart(String userId) async {
    try {
      DocumentSnapshot doc = await userCollection.doc(userId).get();
      if (doc.exists) {
        Map<int, int> cart = (doc['cart'] as Map).map((key, value) =>
            MapEntry(int.parse(key.toString()), int.parse(value.toString())));
        cart.clear();
        await updateCart(userId, cart);
      }
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Map<int, int>> getCart(String userId) async {
    try {
      DocumentSnapshot doc = await userCollection.doc(userId).get();

      if (doc.exists) {
        Map<int, int> cart = (doc['cart'] as Map).map((key, value) =>
            MapEntry(int.parse(key.toString()), int.parse(value.toString())));

        return cart;
      } else {
        return {};
      }
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateUserProfile(String userName, String imageUrl) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updateProfile(displayName: userName, photoURL: imageUrl);

        await user.reload();
      } else {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user is currently signed in.',
        );
      }
    } catch (e) {
      d.log(e.toString());
      rethrow;
    }
  }
}
