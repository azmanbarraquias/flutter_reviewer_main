import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/utils/xprint.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth with ChangeNotifier {
  String? refreshToken;
  String? uid;

  bool get isAuth {
    return refreshToken != null;
  }

  String? get token {
    return refreshToken;
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      final fa = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      xPrint('Signup Status: $fa');
      refreshToken = fa.user?.refreshToken;
      uid = fa.user?.uid;
      // Navigator.of(context).pushReplacement(routeName)
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else if (e.code == 'operation-not-allowed') {
        message = 'account email or password not enabled.';
      } else if (e.code == 'invalid-email') {
        message = 'Sorry, the email is not valid, please try other email.';
      }
      if (message != '') {
        showToast(message);
      } else {
        showToast('SignUp Success, CODE: ${e.code}, MESSAGE: ${e.message}');
      }
      xPrint('CODE: ${e.code}, '
          'MESSAGE: ${e.message},'
          'CREDENTIAL: ${e.credential}');
      rethrow;
    } catch (error) {
      showToast(error);
      xPrint('signup error: $error');
      rethrow;
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      final fa = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      xPrint('Signin Status: $fa');
      refreshToken = fa.user?.refreshToken;
      uid = fa.user?.uid;
      // Navigator.of(context).pushReplacement(routeName)
    } on FirebaseAuthException catch (e) {
      showToast('SignIn: CODE: ${e.code}, MESSAGE: ${e.message}');
      xPrint('CODE: ${e.code}, '
          'MESSAGE: ${e.message},'
          'CREDENTIAL: ${e.credential},');
      rethrow;
    } catch (error) {
      showToast(error);
      xPrint('signin error: $error');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((_) {
        xPrint('Sign Out');
      });
      // Navigator.of(context).pushReplacement(routeName)
    } on FirebaseAuthException catch (e) {
      xPrint('Error $e');
      rethrow;
    } catch (error) {
      xPrint('signout error: $error');
      rethrow;
    }
  }

  void showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}

// UserCredential(
//     additionalUserInfo: AdditionalUserInfo(
//         isNewUser: true,
//         profile: {},
//         providerId: null,
//         username: null,
//         authorizationCode: null),
//     credential: null,
//     user: User(
//         displayName: null,
//         email: 'test@test.com',
//         isEmailVerified: false,
//         isAnonymous: false,
//         metadata: UserMetadata(
//             creationTime: '2024 - 08 - 22 04:47:00.102Z',
//             lastSignInTime: '2024 - 08 - 22 04:47:00.102Z'),
//         phoneNumber: null,
//         photoURL: null,
//         providerData,
//         [
//           UserInfo(
//               displayName: null,
//               email: 'test@test.com',
//               phoneNumber: null,
//               photoURL: null,
//               providerId: 'password',
//               uid: 'test@test.com')
//         ],
//         refreshToken: null,
//         tenantId: null,
//         uid: 'qubUOpMm5QhzRb0mYhglgTTX2w72'));
