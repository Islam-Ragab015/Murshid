class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccsessState extends AuthState {}

final class SignUpFailureState extends AuthState {
  final String errorMessage;

  SignUpFailureState({required this.errorMessage});
}

final class TermsAndConditionsUpdateState extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}

final class SignInLoadingState extends AuthState {}

final class SignInSuccsessState extends AuthState {}

final class SignInFailureState extends AuthState {
  final String errorMessage;

  SignInFailureState({required this.errorMessage});
}
