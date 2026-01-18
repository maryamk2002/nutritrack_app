import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../models/meal.dart';
import '../providers/meal_provider.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/meal_type_selector.dart';

class EditMealScreen extends ConsumerStatefulWidget {
  final Meal meal;

  const EditMealScreen({super.key, required this.meal});

  @override
  ConsumerState<EditMealScreen> createState() => _EditMealScreenState();
}

class _EditMealScreenState extends ConsumerState<EditMealScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _caloriesController;
  late TextEditingController _proteinController;
  late TextEditingController _carbsController;
  late TextEditingController _fatController;
  late MealType _selectedType;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.meal.name);
    _caloriesController = TextEditingController(text: widget.meal.calories.toString());
    _proteinController = TextEditingController(text: widget.meal.protein.toString());
    _carbsController = TextEditingController(text: widget.meal.carbs.toString());
    _fatController = TextEditingController(text: widget.meal.fat.toString());
    _selectedType = widget.meal.type;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _caloriesController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    super.dispose();
  }

  Future<void> _handleSaveMeal() async {
    if (!_formKey.currentState!.validate()) return;

    final updatedMeal = widget.meal.copyWith(
      name: _nameController.text.trim(),
      type: _selectedType,
      calories: int.parse(_caloriesController.text),
      protein: double.tryParse(_proteinController.text) ?? 0,
      carbs: double.tryParse(_carbsController.text) ?? 0,
      fat: double.tryParse(_fatController.text) ?? 0,
    );

    await ref.read(mealProvider.notifier).updateMeal(updatedMeal);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Meal updated successfully!'),
        backgroundColor: AppColors.primary,
      ),
    );

    context.go('/summary');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Header
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.go('/summary'),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Edit Meal',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Meal Type Selection
                const Text(
                  'Meal Type',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: MealTypeSelector(
                    selectedType: _selectedType,
                    onTypeSelected: (type) {
                      setState(() {
                        _selectedType = type;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 32),

                // Food Name
                AppTextField(
                  label: 'Food Name',
                  hint: 'e.g. Avocado Toast',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter food name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Calories
                AppTextField(
                  label: 'Calories',
                  hint: '0',
                  suffix: 'Kcal',
                  controller: _caloriesController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter calories';
                    }
                    final calories = int.tryParse(value);
                    if (calories == null) {
                      return 'Please enter a valid number';
                    }
                    if (calories <= 0) {
                      return 'Calories must be greater than 0';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Macros Section
                const Text(
                  'Nutritional Information (Optional)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),

                // Protein
                AppTextField(
                  label: 'Protein',
                  hint: '0',
                  suffix: 'g',
                  controller: _proteinController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      if (double.parse(value) < 0) {
                        return 'Cannot be negative';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Carbs
                AppTextField(
                  label: 'Carbohydrates',
                  hint: '0',
                  suffix: 'g',
                  controller: _carbsController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      if (double.parse(value) < 0) {
                        return 'Cannot be negative';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Fat
                AppTextField(
                  label: 'Fat',
                  hint: '0',
                  suffix: 'g',
                  controller: _fatController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      if (double.parse(value) < 0) {
                        return 'Cannot be negative';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),

                // Save Button
                PrimaryButton(
                  text: 'Update Meal',
                  onPressed: _handleSaveMeal,
                  height: 50,
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
