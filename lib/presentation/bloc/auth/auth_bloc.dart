import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullstack_taskmanagement/presentation/bloc/auth/bloc_event.dart';
import 'package:fullstack_taskmanagement/presentation/bloc/auth/bloc_state.dart';
import '../../../features/Auth/domain/usecases/sign_in.dart';
import '../../../features/Auth/domain/usecases/sign_up.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  final SignIn signInUseCase;
  final SignUp signUpUseCase;

  AuthBloc(this.signInUseCase, this.signUpUseCase) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUpEvent);
    on<SignInEvent>(_onSignInEvent);
  }

  Future<void> _onSignUpEvent(
      SignUpEvent event, Emitter<AuthStates> emit) async {
    emit(AuthLoading());
    try {
      await signUpUseCase.execute(event.name, event.email, event.password);
      
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignInEvent(
      SignInEvent event, Emitter<AuthStates> emit) async {
    emit(AuthLoading());
    try {
      final user = await signInUseCase.execute(event.email, event.password);
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(const AuthFailure(
            'Sign in failed. Please check your credentials.'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
