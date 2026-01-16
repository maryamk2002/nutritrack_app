class NutritionData {
  final int caloriesConsumed;
  final int caloriesGoal;
  final double proteinConsumed;
  final double proteinGoal;
  final double carbsConsumed;
  final double carbsGoal;
  final double fatConsumed;
  final double fatGoal;

  const NutritionData({
    this.caloriesConsumed = 0,
    this.caloriesGoal = 2000,
    this.proteinConsumed = 0,
    this.proteinGoal = 150,
    this.carbsConsumed = 0,
    this.carbsGoal = 250,
    this.fatConsumed = 0,
    this.fatGoal = 65,
  });

  double get caloriesProgress => 
      caloriesGoal > 0 ? (caloriesConsumed / caloriesGoal).clamp(0.0, 1.0) : 0;

  double get proteinProgress => 
      proteinGoal > 0 ? (proteinConsumed / proteinGoal).clamp(0.0, 1.0) : 0;

  double get carbsProgress => 
      carbsGoal > 0 ? (carbsConsumed / carbsGoal).clamp(0.0, 1.0) : 0;

  double get fatProgress => 
      fatGoal > 0 ? (fatConsumed / fatGoal).clamp(0.0, 1.0) : 0;

  int get caloriesRemaining => (caloriesGoal - caloriesConsumed).clamp(0, caloriesGoal);

  NutritionData copyWith({
    int? caloriesConsumed,
    int? caloriesGoal,
    double? proteinConsumed,
    double? proteinGoal,
    double? carbsConsumed,
    double? carbsGoal,
    double? fatConsumed,
    double? fatGoal,
  }) {
    return NutritionData(
      caloriesConsumed: caloriesConsumed ?? this.caloriesConsumed,
      caloriesGoal: caloriesGoal ?? this.caloriesGoal,
      proteinConsumed: proteinConsumed ?? this.proteinConsumed,
      proteinGoal: proteinGoal ?? this.proteinGoal,
      carbsConsumed: carbsConsumed ?? this.carbsConsumed,
      carbsGoal: carbsGoal ?? this.carbsGoal,
      fatConsumed: fatConsumed ?? this.fatConsumed,
      fatGoal: fatGoal ?? this.fatGoal,
    );
  }
}

class DailyProgress {
  final DateTime date;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;

  const DailyProgress({
    required this.date,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });
}

