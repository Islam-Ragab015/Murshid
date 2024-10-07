class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccsessState extends AuthState {}

final class SignUpFailureState extends AuthState {
  final String errorMessage;

  SignUpFailureState({required this.errorMessage});
}
