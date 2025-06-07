import 'dart:io';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/nutrition_data.dart';

class GeminiService {
  // Replace with your Gemini API key
  final String? _apiKey = dotenv.env['GEMINI_API_KEY'];

  // ✅ Correct Gemini 1.5 Flash endpoint
  final String? _apiUrl = dotenv.env['BASE_URL'];

  static const String _prompt = '''From this image, list the food items and provide estimated nutritional values (calories, protein, fat, carbs) per item.

Please respond in the following JSON format:
{
  "food_items": [
    {
      "name": "Food Item Name",
      "calories": 0,
      "protein": 0,
      "fat": 0,
      "carbs": 0
    }
  ]
}

If unable to identify specific food, return "Unknown food item" and general estimate.''';

  Future<NutritionData> analyzeFood(File imageFile) async {
    try {
      // Determine MIME type
      final mimeType = imageFile.path.toLowerCase().endsWith('.png')
          ? 'image/png'
          : 'image/jpeg';

      // Encode image to base64
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      // Request body
      final requestBody = {
        "contents": [
          {
            "parts": [
              {"text": _prompt},
              {
                "inline_data": {
                  "mime_type": mimeType,
                  "data": base64Image,
                }
              }
            ]
          }
        ],
        "generationConfig": {
          "temperature": 0.4,
          "topK": 32,
          "topP": 1,
          "maxOutputTokens": 1024,
        }
      };

      final response = await http.post(
        Uri.parse('$_apiUrl?key=$_apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final content = responseData['candidates'][0]['content']['parts'][0]['text'];

        return _parseNutritionResponse(content);
      } else {
        throw Exception(
            'Failed with ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error analyzing image: $e');
    }
  }

  // Helper to extract JSON from Gemini response
  NutritionData _parseNutritionResponse(String response) {
    try {
      final jsonStart = response.indexOf('{');
      final jsonEnd = response.lastIndexOf('}') + 1;

      if (jsonStart == -1 || jsonEnd == 0) {
        throw Exception('No valid JSON found in Gemini response.');
      }

      final jsonString = response.substring(jsonStart, jsonEnd);
      final Map<String, dynamic> data = json.decode(jsonString);

      return NutritionData.fromJson(data);
    } catch (e) {
      return NutritionData(
        foodItems: [
          FoodItem(
            name: 'Unidentified Food',
            calories: 0,
            protein: 0.0,
            fat: 0.0,
            carbs: 0.0,
          ),
        ],
      );
    }
  }
}
