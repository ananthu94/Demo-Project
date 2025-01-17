import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      return await _auth.signInWithCredential(cred);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      exceptionHandler(e.code);
    } catch (e) {
      log('Something went wrong');

      return null;
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      exceptionHandler(e.code);
    } catch (e) {
      log('Something went wrong');
      return null;
    }
    return null;
  }

  String verifyId = "";
  // to sent and otp to user
  Future<void> sentOtp({
    required String phone,
    required Function errorStep,
    required Function nextStep,
  }) async {
    await _auth
        .verifyPhoneNumber(
      timeout: const Duration(seconds: 30),
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) async {
        return;
      },
      verificationFailed: (error) async {
        return;
      },
      codeSent: (verificationId, forceResendingToken) async {
        verifyId = verificationId;
        nextStep();
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        return;
      },
    )
        .onError((error, stackTrace) {
      errorStep();
    });
    return null;
  }

  // verify the otp code and login
  Future<String> loginWithOtp({required String otp}) async {
    try {
      final cred =
          PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
      final user = await _auth.signInWithCredential(cred);
      if (user.user != null) {
        return 'Success';
      } else {
        return 'Error in Otp login';
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signout() async {
    // try {
    await _auth.signOut();
    // } catch (e) {
    //   log('Something went wrong');
    // }
  }

  Future<User?> sendResetPasswordLink(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

exceptionHandler(String code) {
  switch (code) {
    case 'invalid-credential':
      log('Login credentials are invalid');
    case 'weak-password':
      log('password must atleast 8 characters');
    case 'email-already-in-use':
      log('Email already used');
    default:
      log('Something went wrong');
  }
}
