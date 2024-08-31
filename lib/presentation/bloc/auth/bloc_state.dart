import 'package:equatable/equatable.dart';
import 'package:fullstack_taskmanagement/features/Auth/domain/entities/users.dart';

abstract class AuthStates extends Equatable {
  const AuthStates();

  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthStates {
  final Users user;

  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthStates {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}
