import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../models/user.dart';

class AuthNotifier extends StateNotifier<AppUser?> {
  AuthNotifier() : super(null) {
    _loadUser();
  }

  bool get isAuthenticated => state != null;

  Future<void> _loadUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      final userName = prefs.getString('userName');
      final userEmail = prefs.getString('userEmail');
      final calorieGoal = prefs.getInt('calorieGoal') ?? 2000;
      final proteinGoal = prefs.getDouble('proteinGoal') ?? 150.0;
      final carbsGoal = prefs.getDouble('carbsGoal') ?? 250.0;
      final fatGoal = prefs.getDouble('fatGoal') ?? 65.0;

      if (userId != null && userName != null && userEmail != null) {
        state = AppUser(
          id: userId,
          name: userName,
          email: userEmail,
          calorieGoal: calorieGoal,
          proteinGoal: proteinGoal,
          carbsGoal: carbsGoal,
          fatGoal: fatGoal,
        );
      }
    } catch (e) {
      // Handle error silently - user will need to login again
    }
  }

  Future<void> _saveUser(AppUser user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', user.id);
      await prefs.setString('userName', user.name);
      await prefs.setString('userEmail', user.email);
      await prefs.setInt('calorieGoal', user.calorieGoal);
      await prefs.setDouble('proteinGoal', user.proteinGoal);
      await prefs.setDouble('carbsGoal', user.carbsGoal);
      await prefs.setDouble('fatGoal', user.fatGoal);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> _clearUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('userId');
      await prefs.remove('userName');
      await prefs.remove('userEmail');
      await prefs.remove('calorieGoal');
      await prefs.remove('proteinGoal');
      await prefs.remove('carbsGoal');
      await prefs.remove('fatGoal');
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> _addRegisteredUser(String email) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final registeredUsers = prefs.getStringList('registeredUsers') ?? [];
      if (!registeredUsers.contains(email)) {
        registeredUsers.add(email);
        await prefs.setStringList('registeredUsers', registeredUsers);
      }
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> _saveUserProfile(String email, String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Store mapping of email -> userId for profile recovery
      final userProfiles = prefs.getStringList('userProfiles_emails') ?? [];
      final userIds = prefs.getStringList('userProfiles_ids') ?? [];
      
      final index = userProfiles.indexOf(email);
      if (index >= 0) {
        userIds[index] = userId;
      } else {
        userProfiles.add(email);
        userIds.add(userId);
      }
      
      await prefs.setStringList('userProfiles_emails', userProfiles);
      await prefs.setStringList('userProfiles_ids', userIds);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<String?> _getUserIdByEmail(String email) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userProfiles = prefs.getStringList('userProfiles_emails') ?? [];
      final userIds = prefs.getStringList('userProfiles_ids') ?? [];
      
      final index = userProfiles.indexOf(email);
      if (index >= 0 && index < userIds.length) {
        return userIds[index];
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> _isUserRegistered(String email) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final registeredUsers = prefs.getStringList('registeredUsers') ?? [];
      return registeredUsers.contains(email);
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Check if user is registered
    final isRegistered = await _isUserRegistered(email);
    if (!isRegistered) {
      return false; // Only registered users can log in
    }
    
    // Get the userId associated with this email
    final userId = await _getUserIdByEmail(email);
    if (userId == null) {
      return false; // No user profile found for this email
    }
    
    // Load user data from storage using the userId
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Try to get stored user data
      final storedUserId = prefs.getString('userId');
      final storedEmail = prefs.getString('userEmail');
      
      // If user data exists from previous session, use it
      if (storedUserId == userId && storedEmail == email) {
        final userName = prefs.getString('userName');
        final calorieGoal = prefs.getInt('calorieGoal') ?? 2000;
        final proteinGoal = prefs.getDouble('proteinGoal') ?? 150.0;
        final carbsGoal = prefs.getDouble('carbsGoal') ?? 250.0;
        final fatGoal = prefs.getDouble('fatGoal') ?? 65.0;
        
        if (userName != null) {
          final user = AppUser(
            id: userId,
            name: userName,
            email: email,
            calorieGoal: calorieGoal,
            proteinGoal: proteinGoal,
            carbsGoal: carbsGoal,
            fatGoal: fatGoal,
          );
          state = user;
          return true;
        }
      } else {
        // User data was cleared, but we can restore using profile mapping
        // Create a minimal user entry with the stored name if available
        // Otherwise, extract name from email
        final userName = email.split('@').first;
        
        final user = AppUser(
          id: userId,
          name: userName,
          email: email,
        );
        
        // Save the restored user
        await _saveUser(user);
        state = user;
        return true;
      }
    } catch (e) {
      // Continue
    }
    
    return false; // Failed to login
  }

  Future<bool> signUp(String name, String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Check if email already registered
    final isRegistered = await _isUserRegistered(email);
    if (isRegistered) {
      return false; // Email already exists
    }
    
    final userId = const Uuid().v4();
    final user = AppUser(
      id: userId,
      name: name,
      email: email,
    );
    state = user;
    await _saveUser(user);
    await _addRegisteredUser(email); // Register the user
    await _saveUserProfile(email, userId); // Save email -> userId mapping
    return true;
  }

  Future<void> logout() async {
    await _clearUser();
    state = null;
  }

  Future<void> updateGoals({
    int? calorieGoal,
    double? proteinGoal,
    double? carbsGoal,
    double? fatGoal,
  }) async {
    if (state != null) {
      final updatedUser = state!.copyWith(
        calorieGoal: calorieGoal,
        proteinGoal: proteinGoal,
        carbsGoal: carbsGoal,
        fatGoal: fatGoal,
      );
      state = updatedUser;
      await _saveUser(updatedUser);
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AppUser?>((ref) {
  return AuthNotifier();
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider) != null;
});

