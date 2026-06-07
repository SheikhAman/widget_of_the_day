# Widget of the Day 📱

A Flutter practice project focused on mastering essential and advanced widgets through hands-on UI building.

This project is built to strengthen core Flutter UI skills by implementing one widget at a time with simple, real-world UI patterns.

---

## 📖 About the Project

**Widget of the Day** is a learning-focused Flutter project where each widget is explored through practical UI examples.  
Instead of theory-heavy learning, this project focuses on *learning by building*.

The goal is to deeply understand Flutter’s layout system, widget behavior, and UI composition by working with small, focused implementations.

🎯 Perfect for:
- Flutter beginners
- Developers revising core UI widgets
- Hands-on UI practice
- Interview preparation (Flutter fundamentals)

---

## 🧩 Widgets Covered

### 1. Container
- Basic layout building block
- Neumorphic UI design practice
- Styling, padding, margin usage

### 2. Expanded
- Flexible layout handling inside `Row` and `Column`
- Understanding space distribution in UI

### 3. Column & Row
- `mainAxisAlignment`
- `crossAxisAlignment`
- Core alignment concepts for Flutter layouts

### 4. ListView.builder
- Dynamic list rendering
- Efficient scrolling lists
- Instagram-style UI layout practice

### 5. ClipRRect
- Rounded corner implementation
- Smooth UI card styling
- Wrapping widgets for modern design feel

### 6. Image.asset
- Loading local assets
- `BoxFit.cover` for clean image scaling
- Card-based image UI design

### 7. GridView.builder
- Grid-based UI layout
- `crossAxisCount` for controlling columns
- Responsive multi-column layouts
- Useful for gallery, products, and dashboard UIs

### 8. GestureDetector
- Handling user interactions like taps, clicks, and gestures
- `onTap: () => { action }` usage
- Making UI elements interactive
- Keeping functional logic separated from UI for better code structure and maintainability

### 9. Bottom Navigation Bar

- Implemented using `StatefulWidget` for managing active tab state
- Used `BottomNavigationBarType.fixed` for consistent tab layout
- Managed multiple pages with indexed navigation
- Demonstrated clean multi-page app structure

### 10. AppBar

- Implemented `leading` widget for left-aligned actions (e.g. menu/back button)
- Used `actions` for right-aligned interactive icons/buttons
- Practiced proper AppBar structure for real-world app UI design

### 11. Drawer (Navigation Panel)

- Implemented `Drawer` for side navigation menu
- Wrapped Drawer content inside `ListView` for smooth scrolling support
- Used `DrawerHeader` for profile/branding section at the top
- Built menu items using `ListTile` for clean and structured navigation options

### 12. SliverAppBar (Advanced Scroll UI)

- Implemented `SliverAppBar` inside `CustomScrollView` for advanced scrolling behavior
- Used `expandedHeight` to create dynamic collapsing header effect
- Practiced `flexibleSpace` for building expandable and animated AppBar content

### 13. TabBar (Tabbed Navigation)

- Implemented tab-based navigation using `TabBar` and `TabBarView`
- Wrapped `Scaffold` with `DefaultTabController` to manage tab state
- Configured `length` to define the number of tabs

### 14. AnimatedContainer (Smooth UI Animations)

- Implemented `AnimatedContainer` for smooth property-based animations
- Used `GestureDetector` to trigger animations on user interaction (`onTap`)
- Controlled animation timing using `duration` (in seconds) for smooth transitions
- Animated UI changes such as size, color, alignment, and decoration

### 15. MediaQuery (Responsive UI Design)

- Used `MediaQuery` to build responsive Flutter layouts
- Accessed screen `height` and `width` for dynamic UI scaling
- Applied `aspect ratio` understanding for maintaining consistent UI proportions across devices
- Handled device `orientation` (portrait / landscape) for adaptive layouts

### 16. AlertDialog (User Interaction & Feedback)

- Implemented `AlertDialog` for showing important user messages and confirmations
- Structured dialog using:
    - `title` for main heading
    - `content` for descriptive message
    - `actions` for user response buttons (e.g. OK / Cancel)

### 17. Text & Styling

- Implemented `Text` widget with advanced styling options
- Used `TextStyle` to customize typography
    - `fontStyle: FontStyle.italic` for italic text effect
    - `fontWeight` for controlling text thickness (light → bold)

### 18. RichText (Advanced Text Styling)

- Implemented `RichText` widget for displaying multiple text styles in a single line
- Used `TextSpan` to break text into styled segments
- Applied a default style at the root level for consistent formatting
- Used multiple child `TextSpan` widgets to style different parts of the text independently

### 19. Timer (Countdown Logic)

- Implemented `Timer` functionality using `StatefulWidget`
- Built a simple countdown UI using `Text` widget
- Managed recurring time updates using `Timer.periodic`

### 20. PageView (Vertical Scrolling UI)

- Implemented `PageView` for swipe-based screen navigation
- Set `scrollDirection: Axis.vertical` for vertical scrolling interaction
- Designed multiple pages representing different “Post” screens
- Enabled smooth full-screen page transitions similar to social media apps

### 21. Stack (Layered UI Layout)

- Implemented `Stack` to place multiple widgets on top of each other
- Built layered UI components by controlling widget positioning and visual hierarchy

### 22. TextField (User Input Handling)

- Implemented `TextField` inside a `StatefulWidget` for dynamic user input
- Styled input field using `decoration` for better UI experience
- Added `suffixIcon` for quick action (e.g. clear input)
- Displayed user input dynamically using `Expanded` widget (`userPost`)

### 23. AnimatedIcon (Animated UI Transitions)

- Implemented `AnimatedIcon` inside a `StatefulWidget` for interactive icon animations
- Used `SingleTickerProviderStateMixin` to provide vsync for smooth animations
- Explored Flutter documentation to understand animation lifecycle and best practices

### 24. Slider (Interactive Value Selection)

- Implemented `Slider` inside a `StatefulWidget` to manage dynamic values
- Used `Slider(value: value, onChanged: onChanged)` for real-time user interaction
- Updated UI instantly as the slider value changed
- Explored customization options available in the Slider widget

### 25. DatePicker (Date Selection)

- Implemented date selection using Flutter's `showDatePicker`
- Displayed a native date picker dialog for user-friendly date input
- Retrieved and displayed the selected date dynamically in the UI

### 26. TimePicker (Time Selection)

- Implemented time selection using Flutter's showTimePicker
- Displayed a native time picker dialog for user-friendly time input
- Used TimeOfDay to store and manage the selected time state
- Retrieved and displayed the selected time dynamically in the UI

### 27. ListWheelScrollView (3D Wheel Scrolling)

- Implemented ListWheelScrollView inside a StatefulWidget to create a 3D wheel-like scrolling effect
- Used itemExtent to define the height of each scroll item
- Applied FixedExtentScrollPhysics for snap-to-item scrolling behavior
- Used onSelectedItemChanged to track and update the currently selected item dynamically

### 28. LinearGradient (Gradient Background Design)

- Implemented LinearGradient inside a Container using BoxDecoration
- Used decoration property to style the container background
- Applied LinearGradient to create smooth multi-color transitions

### 29. ElevatedButton & OutlinedButton (Button Styling & Interaction Design)

- Implemented ElevatedButton and OutlinedButton to understand primary and secondary action patterns in Flutter UI
- Used onPressed callback to handle user interactions and trigger actions
- Customized ElevatedButton using styleFrom() to control elevation, background color, padding, and shape
- Styled OutlinedButton to modify border color, border width, and rounded corners for a clean UI look



---

## 🚀 Goal

To build strong and practical Flutter UI fundamentals by practicing one widget at a time and understanding how real UI layouts are structured in production apps.

---

## 🛠️ Tech Stack

- Flutter
- Dart

---

## 📌 Note

This project is purely for learning and practice purposes.  
Each widget is implemented separately to ensure clarity, focus, and better understanding.

---

## ⭐ Future Improvements

- Add animations for each widget
- Convert widgets into reusable components
- Build mini real-world screens using learned widgets
- Add dark mode UI versions
- Improve UI consistency across all examples