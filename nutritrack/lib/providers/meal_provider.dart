import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/meal.dart';
import '../models/nutrition_data.dart';
import '../models/user.dart';
import 'auth_provider.dart';

class MealNotifier extends StateNotifier<List<Meal>> {
  MealNotifier(this.ref) : super([]) {
    _loadMeals();
  }

  final Ref ref;

  String? get _currentUserId => ref.read(authProvider)?.id;

  Future<void> _loadMeals() async {
    if (_currentUserId == null) {
      state = [];
      return;
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      final mealsKey = 'meals_$_currentUserId';
      final mealsJson = prefs.getString(mealsKey);
      
      if (mealsJson != null) {
        final List<dynamic> mealsList = jsonDecode(mealsJson);
        state = mealsList.map((json) => Meal.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        state = [];
      }
    } catch (e) {
      state = [];
    }
  }

  Future<void> _saveMeals() async {
    if (_currentUserId == null) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      final mealsKey = 'meals_$_currentUserId';
      final mealsJson = jsonEncode(state.map((meal) => meal.toJson()).toList());
      await prefs.setString(mealsKey, mealsJson);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> loadMealsForUser() async {
    // Reload meals for the current user
    await _loadMeals();
  }
  

  Future<void> clearMeals() async {
    if (_currentUserId == null) {
      state = [];
      return;
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      final mealsKey = 'meals_$_currentUserId';
      await prefs.remove(mealsKey);
      state = [];
    } catch (e) {
      state = [];
    }
  }

  Future<void> addMeal(Meal meal) async {
    if (_currentUserId == null) return;
    
    state = [...state, meal];
    await _saveMeals();
  }

  Future<void> removeMeal(String id) async {
    if (_currentUserId == null) return;

    state = state.where((meal) => meal.id != id).toList();
    await _saveMeals();
  }

  Future<void> updateMeal(Meal updatedMeal) async {
    if (_currentUserId == null) return;

    state = state.map((meal) => 
      meal.id == updatedMeal.id ? updatedMeal : meal
    ).toList();
    await _saveMeals();
  }

  List<Meal> getMealsForDate(DateTime date) {
    return state.where((meal) => 
      meal.date.year == date.year &&
      meal.date.month == date.month &&
      meal.date.day == date.day
    ).toList();
  }

  List<Meal> getMealsByType(MealType type) {
    final today = DateTime.now();
    return state.where((meal) => 
      meal.type == type &&
      meal.date.year == today.year &&
      meal.date.month == today.month &&
      meal.date.day == today.day
    ).toList();
  }
}

final mealProvider = StateNotifierProvider<MealNotifier, List<Meal>>((ref) {
  final mealNotifier = MealNotifier(ref);
  
  // Watch auth state and reload meals when user changes
  ref.listen<AppUser?>(authProvider, (previous, next) {
    if (previous?.id != next?.id) {
      // User changed - reload meals for new user or clear if logged out
      if (next == null) {
        // User logged out - clear meals
        mealNotifier.clearMeals();
      } else {
        // User logged in - load their meals
        mealNotifier.loadMealsForUser();
      }
    }
  });
  
  return mealNotifier;
});

final todayMealsProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealProvider);
  final today = DateTime.now();
  return meals.where((meal) => 
    meal.date.year == today.year &&
    meal.date.month == today.month &&
    meal.date.day == today.day
  ).toList();
});

final nutritionDataProvider = Provider<NutritionData>((ref) {
  final meals = ref.watch(todayMealsProvider);
  final user = ref.watch(authProvider);
  
  int calories = 0;
  double protein = 0;
  double carbs = 0;
  double fat = 0;

  for (final meal in meals) {
    calories += meal.calories;
    protein += meal.protein;
    carbs += meal.carbs;
    fat += meal.fat;
  }

  return NutritionData(
    caloriesConsumed: calories,
    caloriesGoal: user?.calorieGoal ?? 2000,
    proteinConsumed: protein,
    proteinGoal: user?.proteinGoal ?? 150.0,
    carbsConsumed: carbs,
    carbsGoal: user?.carbsGoal ?? 250.0,
    fatConsumed: fat,
    fatGoal: user?.fatGoal ?? 65.0,
  );
});

final weeklyProgressProvider = Provider<List<DailyProgress>>((ref) {
  final meals = ref.watch(mealProvider);
  final today = DateTime.now();
  
  return List.generate(7, (index) {
    final date = today.subtract(Duration(days: 6 - index));
    final dayMeals = meals.where((meal) =>
      meal.date.year == date.year &&
      meal.date.month == date.month &&
      meal.date.day == date.day
    ).toList();
    
    int calories = 0;
    double protein = 0;
    double carbs = 0;
    double fat = 0;
    
    for (final meal in dayMeals) {
      calories += meal.calories;
      protein += meal.protein;
      carbs += meal.carbs;
      fat += meal.fat;
    }
    
    return DailyProgress(
      date: date,
      calories: calories,
      protein: protein,
      carbs: carbs,
      fat: fat,
    );
  });
});

