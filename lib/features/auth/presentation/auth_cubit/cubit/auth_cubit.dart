import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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
      if (kDebugMode) {
        emit(SignUpFailureState(errorMessage: e.toString()));
      }
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
}
