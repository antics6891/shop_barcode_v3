import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // sign in
  Future<AuthResponse> signInEmail(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  // SIGN OUT
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
