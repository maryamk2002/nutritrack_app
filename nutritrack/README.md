# NutriTrack - Nutrition Tracking App

A beautiful, modern Flutter nutrition tracking application built from Figma design exports.

## Features

- **🔐 Authentication** - Login/Sign up flow with form validation
- **📊 Dashboard** - Real-time calorie and macro tracking
- **🍽️ Meal Logging** - Add meals with type selection (Breakfast, Lunch, Dinner, Snack)
- **📈 Progress Tracking** - Weekly calorie charts with FL Chart
- **📋 Daily Summary** - Comprehensive nutrition breakdown

## Screenshots

The app includes 9 screens:
1. **Start Screen** - Onboarding/splash with app branding
2. **Auth Choice** - Login or Sign up selection
3. **Login Screen** - Email/password login
4. **Sign Up Screen** - New user registration
5. **Dashboard** - Main home with calorie circle and macros
6. **Add Meal** - Meal type selector and form inputs
7. **Progress** - Weekly bar chart and statistics
8. **Summary** - Daily nutrition summary with insights

## Tech Stack

- **Flutter 3.x** - Cross-platform framework
- **Riverpod** - State management
- **Go Router** - Navigation with deep linking
- **FL Chart** - Beautiful charts
- **Google Fonts** - Typography (Inter font family)

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   ├── meal.dart            # Meal model & types
│   ├── nutrition_data.dart  # Nutrition tracking data
│   └── user.dart            # User model
├── providers/
│   ├── auth_provider.dart   # Authentication state
│   └── meal_provider.dart   # Meal & nutrition state
├── router/
│   └── app_router.dart      # Go Router configuration
├── screens/
│   ├── start_screen.dart    # Onboarding
│   ├── auth_choice_screen.dart
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   ├── dashboard_screen.dart
│   ├── add_meal_screen.dart
│   ├── progress_screen.dart
│   └── summary_screen.dart
├── theme/
│   ├── app_colors.dart      # Color palette
│   └── app_theme.dart       # Theme configuration
└── widgets/
    ├── bottom_nav_shell.dart
    ├── primary_button.dart
    ├── app_text_field.dart
    ├── circular_progress_indicator.dart
    ├── meal_type_selector.dart
    ├── macro_card.dart
    └── meal_card.dart
```

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Primary | `#27A44D` | Buttons, accents, active states |
| Primary Light | `#DBF6E4` | Backgrounds, highlights |
| Text Primary | `#202937` | Headings, body text |
| Text Secondary | `#384151` | Subtitles, descriptions |
| Protein | `#3B82F6` | Protein macro indicator |
| Carbs | `#F97316` | Carbs macro indicator |
| Fat | `#8B5CF6` | Fat macro indicator |

## Getting Started

1. **Install Flutter SDK** (3.0.0 or higher)

2. **Clone and navigate:**
   ```bash
   cd nutritrack
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## Design

This app was built from Figma design exports using DesignCopilot v2. The design follows modern mobile UI/UX patterns with:

- Clean, minimal aesthetic
- Consistent spacing (8px grid)
- Rounded corners (10-20px)
- Subtle shadows for depth
- Smooth animations and transitions

## Demo Credentials

The app accepts any email/password combination for demo purposes. Simply enter any valid email format and password to log in.

## License

MIT License - Feel free to use this as a starting point for your own projects!

