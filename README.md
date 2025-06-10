# carousel_slider

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



# 🎬 Flutter 3D Carousel Slider (Netflix-style Cover Flow)

This Flutter project demonstrates a beautiful **3D image carousel** with interactive animations and a **Netflix-style cover flow effect**.

<p align="center">
  <img src="assets/screenshots/home_screen.png" width="300"/>
</p>

---

## 📐 Architecture

The app is built using the following Flutter components:

- `PageView.builder` — to handle swipe-based page scrolling.
- `Transform` and `Matrix4` — to apply 3D rotation and perspective.
- `AnimationController` and `AnimatedBuilder` — for tap animations.
- `MediaQuery` — to make the UI responsive for tablets and mobile screens.

State management is handled using Flutter's native `StatefulWidget` and `setState()`.

---

## 🛠️ How to Run

1. **Clone the repo:**

   ```bash
   git clone https://github.com/your-username/flutter_3d_carousel_slider.git
   cd flutter_3d_carousel_slider

2. **Install dependencies**

    flutter pub get

3. **Run on emulator/device**

    flutter run



## 💡 Features
    
    1. Smooth 3D rotation and animation.

    2. Center card zooms/lifts with tap.

    3. Netflix-style UI with dark gradient background.

    4. Fully responsive layout for mobile and tablets.

## 🙌 Author

Aryan Singh
Inspired by Netflix's iconic UI & Flutter's animation power ✨