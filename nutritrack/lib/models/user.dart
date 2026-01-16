class AppUser {
  final String id;
  final String name;
  final String email;
  final int calorieGoal;
  final double proteinGoal;
  final double carbsGoal;
  final double fatGoal;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.calorieGoal = 2000,
    this.proteinGoal = 150,
    this.carbsGoal = 250,
    this.fatGoal = 65,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    int? calorieGoal,
    double? proteinGoal,
    double? carbsGoal,
    double? fatGoal,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      calorieGoal: calorieGoal ?? this.calorieGoal,
      proteinGoal: proteinGoal ?? this.proteinGoal,
      carbsGoal: carbsGoal ?? this.carbsGoal,
      fatGoal: fatGoal ?? this.fatGoal,
    );
  }
}

