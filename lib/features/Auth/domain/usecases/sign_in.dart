import 'package:fullstack_taskmanagement/features/Auth/domain/entities/users.dart';
import 'package:fullstack_taskmanagement/features/Auth/domain/repository/auth_repository.dart';

class SignIn {
  final AuthRepository repository;

  SignIn({required this.repository});

  Future<Users?> execute(String email, String password) {
    return repository.signIn(email, password);
  }
}
