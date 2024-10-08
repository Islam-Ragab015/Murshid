import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? emailAddress;
  String? firstName;
  String? lastName;
  String? password;
  bool? updateTermsAndConditionsCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> signInFormKey = GlobalKey();

  // Sign up function with enhanced error handling
  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      await addUserPrfile();
      await verfiyEmail();
      emit(SignUpSuccsessState());
    } on FirebaseAuthException catch (e) {
      _signUpHandleException(e);
    } catch (e) {
      emit(SignUpFailureState(errorMessage: e.toString()));
    }
  }

// Enhanced error handling
  void _signUpHandleException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SignUpFailureState(
          errorMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignUpFailureState(
          errorMessage: 'The account already exists for that email.'));
    } else if (e.code == 'invalid-email') {
      emit(SignUpFailureState(errorMessage: 'The email address is not valid.'));
    } else if (e.code == 'operation-not-allowed') {
      emit(SignUpFailureState(
          errorMessage: 'Email/password accounts are not enabled.'));
    } else if (e.code == 'network-request-failed') {
      emit(SignUpFailureState(
          errorMessage:
              'Network error. Please check your internet connection.'));
    } else {
      emit(SignUpFailureState(
          errorMessage: e.message ?? 'An unknown error occurred.'));
    }
  }

  // Sign in function with enhanced error handling
  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccsessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState(
            errorMessage: 'Wrong password provided for that user.'));
      } else if (e.code == 'user-disabled') {
        emit(SignInFailureState(
            errorMessage: 'This user account has been disabled.'));
      } else if (e.code == 'invalid-email') {
        emit(SignInFailureState(
            errorMessage: 'The email address is not valid.'));
      } else if (e.code == 'network-request-failed') {
        emit(SignInFailureState(
            errorMessage:
                'Network error. Please check your internet connection.'));
      } else {
        emit(SignInFailureState(
            errorMessage: e.message ?? 'An unknown error occurred.'));
      }
    } catch (e) {
      emit(SignInFailureState(errorMessage: e.toString()));
    }
  }

  // Update terms and conditions checkbox value
  updateTermsAndConditionsCheckBox({required newvalue}) {
    updateTermsAndConditionsCheckBoxValue = newvalue;
    emit(TermsAndConditionsUpdateState());
  }

  // Toggle password visibility
  void obscurePasswordText() {
    obscurePasswordTextValue = !obscurePasswordTextValue!;
    emit(ObscurePasswordTextUpdateState());
  }

//  New method in AuthCubit to send email verification
  Future<void> verfiyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

// New method in AuthCubit to send password reset email with better state management
  Future<void> sendPasswordResetEmail() async {
    try {
      emit(ResetPasswordLoadingState()); // Start loading state
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState()); // Emit success state
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ResetPasswordFailureState(
            errorMessage: 'No user found for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(ResetPasswordFailureState(
            errorMessage: 'The email address is not valid.'));
      } else if (e.code == 'network-request-failed') {
        emit(ResetPasswordFailureState(
            errorMessage:
                'Network error. Please check your internet connection.'));
      } else {
        emit(ResetPasswordFailureState(
            errorMessage: e.message ?? 'An unknown error occurred.'));
      }
    } catch (e) {
      emit(ResetPasswordFailureState(errorMessage: e.toString()));
    }
  }

// New method in AuthCubit to add user profile
  Future<void> addUserPrfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({
      "first_name": firstName,
      "last_name": lastName,
      "email": emailAddress,
    });
  }
}
