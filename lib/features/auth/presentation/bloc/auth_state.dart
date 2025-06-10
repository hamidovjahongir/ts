part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String token;

  AuthSuccess({required this.token});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}