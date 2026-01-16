import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

class AuthNotifier extends StateNotifier<AppUser?> {
  AuthNotifier() : super(null);

  bool get isAuthenticated => state != null;

  Future<bool> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Demo login - accept any email/password
    state = AppUser(
      id: '1',
      name: email.split('@').first,
      email: email,
    );
    return true;
  }

  Future<bool> signUp(String name, String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    
    state = AppUser(
      id: '1',
      name: name,
      email: email,
    );
    return true;
  }

  void logout() {
    state = null;
  }

  void updateGoals({
    int? calorieGoal,
    double? proteinGoal,
    double? carbsGoal,
    double? fatGoal,
  }) {
    if (state != null) {
      state = state!.copyWith(
        calorieGoal: calorieGoal,
        proteinGoal: proteinGoal,
        carbsGoal: carbsGoal,
        fatGoal: fatGoal,
      );
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AppUser?>((ref) {
  return AuthNotifier();
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider) != null;
});

