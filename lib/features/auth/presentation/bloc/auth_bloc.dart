import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_boursa/core/services/shared_preferences_service.dart';
import 'package:p_boursa/features/auth/data/models/authmodel.dart';
import 'package:p_boursa/features/auth/data/repositories/authrepo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(status: CubitStatus.loading));
      final result = await Authrepo().login(event.toMap());
      result.fold((left) {
        emit(state.copyWith(status: CubitStatus.failed));
      }, (right) async {
        emit(state.copyWith(status: CubitStatus.success, model: right));
        await SharedPreferencesService.setToken(right.authToken!);
      });
    });
    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(status: CubitStatus.loading));
      final result = await Authrepo().register(event.toMap());
      result.fold((left) {
        emit(state.copyWith(status: CubitStatus.failed));
      }, (right) {
        add(LoginEvent(email: event.email, password: event.password));
      });
    });
  }
}
