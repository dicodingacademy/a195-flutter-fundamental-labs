// todo-01-auth-02: create a service to connect the firebase auth
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // todo-01-auth-03: inject a firebase auth instance
  final FirebaseAuth _auth;

  FirebaseAuthService(
    FirebaseAuth? auth,
  ) : _auth = auth ??= FirebaseAuth.instance;

  // todo-01-auth-04: register an account
  Future<UserCredential> createUser(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      final errorMessage = switch (e.code) {
        "email-already-in-use" =>
          "There already exists an account with the given email address.",
        "invalid-email" => "The email address is not valid.",
        "operation-not-allowed" => "Server error, please try again later.",
        "weak-password" => "The password is not strong enough.",
        _ => "Register failed. Please try again.",
      };
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e);
    }
  }

  // todo-01-auth-05: login using acount that have been registered
  Future<UserCredential> signInUser(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      final errorMessage = switch (e.code) {
        "invalid-email" => "The email address is not valid.",
        "user-disabled" => "User disabled.",
        "user-not-found" => "No user found with this email.",
        "wrong-password" => "Wrong email/password combination.",
        _ => "Login failed. Please try again.",
      };
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e);
    }
  }

  // todo-01-auth-06: logout dont forget
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception("Logout failed. Please try again.");
    }
  }
}
