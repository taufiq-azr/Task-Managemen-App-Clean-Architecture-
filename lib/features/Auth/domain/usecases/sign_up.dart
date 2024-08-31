import 'package:fullstack_taskmanagement/features/Auth/domain/repository/auth_repository.dart';

class SignUp {
  final AuthRepository repository;

  SignUp({required this.repository});

  Future<void> execute(String name, String email, String password) {
    return repository.signUp(name, email, password);
  }
}
