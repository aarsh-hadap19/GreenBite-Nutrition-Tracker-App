# 🌱 GreenBite - Smart Nutrition Tracker

<div align="center">
  <img src="https://github.com/aarsh-hadap19/GreenBite-Nutrition-Tracker-App/blob/main/assets/app_icon.png" alt="GreenBite Logo" width="120" height="120" style="border-radius: 20px;"/>
  
  **Simple • Smart • Healthy**
  
  *Track your nutrition effortlessly with AI-powered food analysis*
  
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
  [![AI](https://img.shields.io/badge/Google-Gemini_AI-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://ai.google.dev)
</div>

---

## 📱 About GreenBite

**GreenBite** is a revolutionary Flutter app that makes nutrition tracking as simple as taking a photo. Using cutting-edge AI technology, it instantly analyzes your meals and provides detailed nutritional information, helping you make informed decisions about your diet and maintain a healthy lifestyle.

### 🎯 **Why GreenBite?**

- **🔍 Instant Analysis**: Just snap a photo and get detailed nutrition facts
- **🤖 AI-Powered**: Uses Google Gemini AI for accurate food recognition
- **📊 Complete Breakdown**: Calories, protein, fat, and carbs for each item
- **🧮 Smart Totals**: Automatic calculation of total meal nutrition
- **📱 Beautiful UI**: Modern, intuitive design that makes tracking enjoyable
- **⚡ Lightning Fast**: Get results in seconds, not minutes

---

## ✨ Key Features

### 🔥 **Core Functionality**
| Feature | Description |
|---------|-------------|
| **📷 Smart Camera** | Take photos directly in-app with optimized settings |
| **🖼️ Gallery Integration** | Select existing photos from your device |
| **🤖 AI Food Recognition** | Advanced AI identifies multiple food items in one image |
| **📈 Nutrition Analysis** | Detailed breakdown of calories, protein, fat, and carbs |
| **🎯 Meal Totals** | Automatic calculation of complete meal nutrition |
| **💫 Beautiful Animations** | Smooth, engaging user experience |

### 🎨 **User Experience**
- **Splash Screen**: Elegant animated welcome experience
- **Intuitive Navigation**: Simple, one-tap interactions
- **Visual Feedback**: Clear loading states and progress indicators
- **Error Handling**: Graceful error management with helpful messages
- **Responsive Design**: Works perfectly on all screen sizes

### 🏗️ **Technical Excellence**
- **Modular Architecture**: Clean, maintainable code structure
- **Reusable Components**: Efficient widget system
- **Performance Optimized**: Fast image processing and API calls
- **Cross-Platform**: Native iOS and Android support

---

## 🚀 Quick Start

### Prerequisites
- **Flutter SDK** (3.10.0+)
- **Android Studio** or **VS Code**
- **Google Gemini API Key**

### 1️⃣ **Get Your API Key**
1. Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create a new API key
3. Copy and save it securely

### 2️⃣ **Setup Project**
```bash
# Clone or create project
flutter create greenbite
cd greenbite

# Install dependencies
flutter pub get
```

### 3️⃣ **Add Your API Key**
Open `lib/services/gemini_service.dart` and replace:
```dart
static const String _apiKey = 'YOUR_GEMINI_API_KEY_HERE';
```

### 4️⃣ **Add App Icon**
Place your app icon in `assets/images/app_icon.png`

### 5️⃣ **Run the App**
```bash
flutter run
```

---

## 📁 Project Structure

```
lib/
├── 📱 main.dart                    # App entry point
├── 🖥️ screens/
│   ├── splash_screen.dart          # Animated splash screen
│   └── home_screen.dart            # Main app interface
├── 🔧 services/
│   └── gemini_service.dart         # AI API integration
├── 📊 models/
│   └── nutrition_data.dart         # Data structures
└── 🎨 widgets/
    ├── image_picker_widget.dart    # Camera/gallery selection
    ├── nutrition_display_widget.dart # Results display
    └── loading_widget.dart         # Loading animations
```

---

## 🎯 How to Use GreenBite

### **Step 1: Launch**
Open GreenBite and enjoy the beautiful splash screen animation

### **Step 2: Choose Image Source**
- 📷 **Camera**: Take a fresh photo of your meal
- 🖼️ **Gallery**: Select an existing food photo

### **Step 3: Capture/Select**
Take a clear photo showing your food items or select from gallery

### **Step 4: Analyze**
Tap "Analyze Nutrition" and let AI work its magic

### **Step 5: Review Results**
- View individual food items with detailed nutrition
- See total meal calories prominently displayed
- Get breakdown of protein, fat, and carbs

---

## 🔧 Configuration

### **Android Setup**
Update `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.INTERNET" />
```

### **iOS Setup**
Update `ios/Runner/Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>GreenBite needs camera access to analyze your food</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>GreenBite needs photo access to analyze your food images</string>
```

### **Dependencies**
```yaml
dependencies:
  flutter:
    sdk: flutter
  image_picker: ^1.0.4    # Camera & gallery access
  http: ^1.1.0            # API communication
  cupertino_icons: ^1.0.2 # iOS-style icons
```

---

## 🎨 Customization

### **Color Scheme**
Modify colors in `main.dart`:
```dart
primaryColor: const Color(0xFF4CAF50),  // Main green
scaffoldBackgroundColor: const Color(0xFFF8F9FA),  // Light background
```

### **AI Prompt**
Customize analysis in `gemini_service.dart`:
```dart
static const String _prompt = '''Your custom prompt here...''';
```

### **Animations**
Adjust splash screen timing in `splash_screen.dart`:
```dart
duration: const Duration(milliseconds: 1500),  // Animation speed
```

---

## 🔍 Troubleshooting

### **Common Issues & Solutions**

| Issue | Solution |
|-------|----------|
| **🔑 API Key Error** | Verify your Gemini API key is correct and active |
| **📷 Camera Not Working** | Check camera permissions in device settings |
| **🌐 Network Error** | Ensure stable internet connection |
| **🔄 Build Issues** | Run `flutter clean && flutter pub get` |
| **📱 App Icon Missing** | Add `app_icon.png` to `assets/images/` folder |

### **Performance Tips**
- Ensure good lighting for better food recognition
- Keep images under 5MB for faster processing
- Use clear, focused photos for best results

---

## 🚧 Roadmap

### **Coming Soon**
- [ ] 📝 **Meal History**: Track your nutrition over time
- [ ] 📊 **Weekly Reports**: Detailed nutrition analytics
- [ ] 🎯 **Goal Setting**: Set and track nutrition targets
- [ ] 🔄 **Export Data**: Share your nutrition data
- [ ] 👥 **User Profiles**: Multiple user support
- [ ] 📱 **Widget Support**: Home screen nutrition widget

### **Future Enhancements**
- [ ] 🍽️ **Meal Planning**: AI-powered meal suggestions
- [ ] 🛒 **Shopping Lists**: Generate lists from meal plans
- [ ] 🏆 **Achievements**: Gamify your nutrition journey
- [ ] 📈 **Integration**: Connect with fitness apps
- [ ] 🔊 **Voice Commands**: Hands-free nutrition logging

---

## 🤝 Contributing

We welcome contributions to make GreenBite even better!

### **How to Contribute**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### **Development Guidelines**
- Follow Flutter best practices
- Write clear, commented code
- Test on both iOS and Android
- Update documentation for new features

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **Google Gemini AI** for powerful food recognition
- **Flutter Team** for the amazing framework
- **Material Design** for beautiful UI components
- **Open Source Community** for inspiration and support

---

## 📞 Support

Having issues or questions? We're here to help!

- 🐛 **Bug Reports**: Open an issue on GitHub
- 💡 **Feature Requests**: Share your ideas with us
- 📧 **Contact**: [aarshhadap19@gmail.com](mailto:your-email@example.com)
- 💬 **Discussions**: Join our community discussions

---

<div align="center">
  
**Made with ❤️ for a healthier world**

*GreenBite - Where Technology Meets Nutrition*

**⭐ Star this repo if you found it helpful!**

</div>
