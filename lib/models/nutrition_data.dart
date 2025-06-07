class NutritionData {
  final List<FoodItem> foodItems;

  NutritionData({required this.foodItems});

  factory NutritionData.fromJson(Map<String, dynamic> json) {
    var foodItemsList = json['food_items'] as List;
    List<FoodItem> items = foodItemsList
        .map((item) => FoodItem.fromJson(item))
        .toList();

    return NutritionData(foodItems: items);
  }

  // Calculate total nutrition values
  double get totalCalories => foodItems.fold(0, (sum, item) => sum + item.calories);
  double get totalProtein => foodItems.fold(0, (sum, item) => sum + item.protein);
  double get totalFat => foodItems.fold(0, (sum, item) => sum + item.fat);
  double get totalCarbs => foodItems.fold(0, (sum, item) => sum + item.carbs);
}

class FoodItem {
  final String name;
  final double calories;
  final double protein;
  final double fat;
  final double carbs;

  FoodItem({
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'] ?? 'Unknown Food',
      calories: (json['calories'] ?? 0).toDouble(),
      protein: (json['protein'] ?? 0).toDouble(),
      fat: (json['fat'] ?? 0).toDouble(),
      carbs: (json['carbs'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
    };
  }
}