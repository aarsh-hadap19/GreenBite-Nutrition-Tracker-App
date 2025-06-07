import 'package:flutter/material.dart';
import '../models/nutrition_data.dart';

class NutritionDisplayWidget extends StatelessWidget {
  final NutritionData nutritionData;

  const NutritionDisplayWidget({
    super.key,
    required this.nutritionData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTotalNutritionCard(),
        const SizedBox(height: 16),
        _buildFoodItemsList(),
      ],
    );
  }

  Widget _buildTotalNutritionCard() {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.local_fire_department,
              size: 32,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            const Text(
              'Total Meal Nutrition',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNutritionItem(
                  'Calories',
                  '${nutritionData.totalCalories.toInt()}',
                  'kcal',
                  Colors.white,
                ),
                _buildNutritionItem(
                  'Protein',
                  '${nutritionData.totalProtein.toStringAsFixed(1)}',
                  'g',
                  Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNutritionItem(
                  'Fat',
                  '${nutritionData.totalFat.toStringAsFixed(1)}',
                  'g',
                  Colors.white,
                ),
                _buildNutritionItem(
                  'Carbs',
                  '${nutritionData.totalCarbs.toStringAsFixed(1)}',
                  'g',
                  Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItemsList() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.restaurant,
                  color: Color(0xFF4CAF50),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Food Items Detected',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...nutritionData.foodItems.map((item) => _buildFoodItemCard(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItemCard(FoodItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildNutritionItem(
                  'Cal',
                  '${item.calories.toInt()}',
                  'kcal',
                  Colors.orange,
                ),
              ),
              Expanded(
                child: _buildNutritionItem(
                  'Protein',
                  '${item.protein.toStringAsFixed(1)}',
                  'g',
                  Colors.red,
                ),
              ),
              Expanded(
                child: _buildNutritionItem(
                  'Fat',
                  '${item.fat.toStringAsFixed(1)}',
                  'g',
                  Colors.purple,
                ),
              ),
              Expanded(
                child: _buildNutritionItem(
                  'Carbs',
                  '${item.carbs.toStringAsFixed(1)}',
                  'g',
                  Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionItem(String label, String value, String unit, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              TextSpan(
                text: ' $unit',
                style: TextStyle(
                  fontSize: 12,
                  color: color.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}