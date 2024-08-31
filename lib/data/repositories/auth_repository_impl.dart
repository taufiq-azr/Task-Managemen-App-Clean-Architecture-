import 'package:fullstack_taskmanagement/features/Auth/domain/entities/users.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/Auth/domain/repository/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient client;

  AuthRepositoryImpl(this.client);

  @override
  Future<Users?> signIn(String email, String password) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception('Sign up failed: Unknown error');
      }

      final userData = response.user?.userMetadata;
      if (userData != null) {
        return UserModel(
          id: response.user!.id,
          name: userData['name'] ?? '',
          email: response.user!.email ?? '',
        );
      }
      return null;
    } on AuthException catch (e) {
      if (e.message.contains('email already exists')) {
        throw Exception('Email already exists');
      }
      rethrow; // Handle other errors
    }
  }

  @override
  Future<void> signOut() async {
    await client.auth.signOut();
  }

  @override
  Future<void> signUp(String name, String email, String password) async {
    final response = await client.auth.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );

    if (response.user == null) {
      throw Exception('Sign up failed: Unknown error');
    }
  }
}
