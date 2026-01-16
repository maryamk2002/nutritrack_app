enum MealType {
  breakfast,
  lunch,
  dinner,
  snack,
}

extension MealTypeExtension on MealType {
  String get displayName {
    switch (this) {
      case MealType.breakfast:
        return 'Breakfast';
      case MealType.lunch:
        return 'Lunch';
      case MealType.dinner:
        return 'Dinner';
      case MealType.snack:
        return 'Snack';
    }
  }

  String get icon {
    switch (this) {
      case MealType.breakfast:
        return '🥐';
      case MealType.lunch:
        return '🍽️';
      case MealType.dinner:
        return '🍲';
      case MealType.snack:
        return '🍎';
    }
  }
}

class Meal {
  final String id;
  final String name;
  final MealType type;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;
  final DateTime date;

  const Meal({
    required this.id,
    required this.name,
    required this.type,
    required this.calories,
    this.protein = 0,
    this.carbs = 0,
    this.fat = 0,
    required this.date,
  });

  Meal copyWith({
    String? id,
    String? name,
    MealType? type,
    int? calories,
    double? protein,
    double? carbs,
    double? fat,
    DateTime? date,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      date: date ?? this.date,
    );
  }
}

