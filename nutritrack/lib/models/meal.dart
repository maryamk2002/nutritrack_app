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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.name,
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'date': date.toIso8601String(),
    };
  }

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'] as String,
      name: json['name'] as String,
      type: MealType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => MealType.breakfast,
      ),
      calories: json['calories'] as int,
      protein: (json['protein'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );
  }
}

