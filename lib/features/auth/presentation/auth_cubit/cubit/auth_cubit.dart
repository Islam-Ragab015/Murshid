import 'package:bloc/bloc.dart';
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

  signUpWithEmailAndPasswoed() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccsessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (e.code == 'weak-password') {
          emit(SignUpFailureState(
              errorMessage: "'The password provided is too weak.'"));
        }
      } else if (e.code == 'email-already-in-use') {
        if (e.code == 'email-already-in-use') {
          emit(SignUpFailureState(
              errorMessage: 'The account already exists for that email.'));
        }
      }
    } catch (e) {
      emit(SignUpFailureState(errorMessage: e.toString()));
    }
  }

  updateTermsAndConditionsCheckBox({required newvalue}) {
    updateTermsAndConditionsCheckBoxValue = newvalue;
    emit(TermsAndConditionsUpdateState());
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  signInWithEmailAndPasswoed() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccsessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(
          SignInFailureState(errorMessage: 'No user found for that email.'),
        );
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState(
            errorMessage: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(SignInFailureState(errorMessage: e.toString()));
    }
  }
}
