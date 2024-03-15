part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();
}
class AuthSuccess extends AuthState {
  const AuthSuccess();
}
class AuthFailure extends AuthState {
  const AuthFailure();
}
