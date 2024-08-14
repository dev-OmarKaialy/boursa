part of 'auth_bloc.dart';

enum CubitStatus { loading, init, success, failed }

class AuthState {
  final CubitStatus status;
  final AuthModel? model;

  AuthState({
    this.status = CubitStatus.init,
    this.model,
  });

  AuthState copyWith({
    CubitStatus? status,
    AuthModel? model,
  }) {
    return AuthState(
      status: status ?? this.status,
      model: model ?? this.model,
    );
  }
}
