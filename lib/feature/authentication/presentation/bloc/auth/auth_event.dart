part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SignInEmailPasswordAuthEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  const SignInEmailPasswordAuthEvent({
    required this.email,
    required this.password,
    required this.context,
  });
}

class SignUpEmailPasswordAuthEvent extends AuthEvent {
  final String email;
  final String password;
  final String displayName;
  final BuildContext context;

  const SignUpEmailPasswordAuthEvent({
    required this.displayName,
    required this.email,
    required this.password,
    required this.context,
  });
}

class SignOutAuthEvent extends AuthEvent {
  final BuildContext context;

  const SignOutAuthEvent({
    required this.context,
  });
}

class SendRecoveryEmailAuthEvent extends AuthEvent {
  final String email;
  final BuildContext context;

  const SendRecoveryEmailAuthEvent({
    required this.email,
    required this.context,
  });
}

class SignInWithGoogleAuthEvent extends AuthEvent {
  final BuildContext context;

  const SignInWithGoogleAuthEvent({
    required this.context,
  });
}

class SignInWithAppleAuthEvent extends AuthEvent {
  final BuildContext context;

  const SignInWithAppleAuthEvent({
    required this.context,
  });
}


class SignInWithFacebookAuthEvent extends AuthEvent {
  final BuildContext context;

  const SignInWithFacebookAuthEvent({
    required this.context,
  });
}