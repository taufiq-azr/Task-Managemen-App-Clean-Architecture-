import 'package:fullstack_taskmanagement/features/Auth/domain/entities/users.dart';

abstract class AuthRepository {
  Future<void> signUp(String name, String email, String password);
  Future<Users?> signIn(String email, String password);
  Future<void> signOut();
}
