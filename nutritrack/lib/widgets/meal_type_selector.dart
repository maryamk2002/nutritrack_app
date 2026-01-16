import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../theme/app_colors.dart';

class MealTypeSelector extends StatelessWidget {
  final MealType? selectedType;
  final ValueChanged<MealType> onTypeSelected;

  const MealTypeSelector({
    super.key,
    this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      runSpacing: 14,
      children: MealType.values.map((type) {
        final isSelected = selectedType == type;
        return _MealTypeCard(
          type: type,
          isSelected: isSelected,
          onTap: () => onTypeSelected(type),
        );
      }).toList(),
    );
  }
}

class _MealTypeCard extends StatelessWidget {
  final MealType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _MealTypeCard({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 145,
        height: 66,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : AppColors.inputBackground.withOpacity(0.75),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderDark,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
        child: Row(
          children: [
            Text(
              type.icon,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 12),
            Text(
              type.displayName,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                letterSpacing: -0.22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

