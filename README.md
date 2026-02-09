# 🚀 Flutter Minimal CRUD with SQFlite & GetX
A clean, production-ready implementation of a local user management system built with **Flutter**, **SQFlite**, and **GetX**. This project demonstrates a minimal white-focused design pattern with robust error handling and reactive state management.
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=Flutter&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-%238B5CF6.svg?style=flat)
## ✨ Key Features
- 💾 **Local Persistence**: Full CRUD operations using SQFlite.
- ⚡ **Reactive State Management**: Implementation using GetX for instant UI updates.
- 🎨 **Minimal UI/UX**: Professional white-focused design with smooth animations.
- 🛡️ **Robust Validation**: Clean validation patterns using Mixins.
- 📧 **Unique Email Logic**: Smart duplicate entry handling with real-time user feedback.
- 📱 **Responsive Design**: Clean lists and interactive forms optimized for mobile.
## 🛠️ Tech Stack
- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [GetX](https://pub.dev/packages/get)
- **Database**: [SQFlite](https://pub.dev/packages/sqflite)
- **Local Storage Path**: `path_provider`
- **Architecture**: Controller-based (GetX) with clean separation of concerns.
## 📸 Screenshots
|                           Entry Form                           |                          User List                           |                         Error Handling                          |
| :------------------------------------------------------------: | :----------------------------------------------------------: | :-------------------------------------------------------------: |
| ![Form](https://via.placeholder.com/200x400?text=Minimal+Form) | ![List](https://via.placeholder.com/200x400?text=Clean+List) | ![Error](https://via.placeholder.com/200x400?text=Smart+Alerts) |
> [!TIP]
> Replace these placeholders with your actual app screenshots for a professional look!
## 🚀 Getting Started
### Prerequisites
- Flutter SDK Installed
- Android Studio / VS Code with Flutter extension
- An emulator or physical device
### Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/flutter-minimal-crud.git
   ```
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Run the app**
   ```bash
   flutter run
   ```
## 🏗️ Project Structure
```text
lib/
├── db_handler.dart      # Database initialization & CRUD logic
├── db_model.dart        # Data model classes
├── db_extension.dart    # Helper extensions for database checks
├── user_controller.dart # GetX state management logic
├── main_screen.dart     # Primary UI with minimalist design
├── validation_mixin.dart # Reusable validation logic
└── main.dart            # Theme and app entry point
```
## 📜 License
Distributed under the MIT License. See `LICENSE` for more information.
---
⭐ **If you find this project helpful, give it a star!**
