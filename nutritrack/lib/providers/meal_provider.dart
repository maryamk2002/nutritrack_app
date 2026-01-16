import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';
import '../models/nutrition_data.dart';

class MealNotifier extends StateNotifier<List<Meal>> {
  MealNotifier() : super(_sampleMeals);

  static final List<Meal> _sampleMeals = [
    Meal(
      id: '1',
      name: 'Avocado Toast',
      type: MealType.breakfast,
      calories: 350,
      protein: 12,
      carbs: 30,
      fat: 22,
      date: DateTime.now(),
    ),
    Meal(
      id: '2',
      name: 'Greek Yogurt',
      type: MealType.breakfast,
      calories: 150,
      protein: 15,
      carbs: 12,
      fat: 5,
      date: DateTime.now(),
    ),
    Meal(
      id: '3',
      name: 'Grilled Chicken Salad',
      type: MealType.lunch,
      calories: 420,
      protein: 35,
      carbs: 15,
      fat: 18,
      date: DateTime.now(),
    ),
  ];

  void addMeal(Meal meal) {
    state = [...state, meal];
  }

  void removeMeal(String id) {
    state = state.where((meal) => meal.id != id).toList();
  }

  void updateMeal(Meal updatedMeal) {
    state = state.map((meal) => 
      meal.id == updatedMeal.id ? updatedMeal : meal
    ).toList();
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
  return MealNotifier();
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
    proteinConsumed: protein,
    carbsConsumed: carbs,
    fatConsumed: fat,
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

