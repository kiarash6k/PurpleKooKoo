import 'package:flutter/material.dart';

/// Brand colours taken from the original purple gradient.
class Brand {
  static const Color deepIndigo = Color.fromARGB(255, 24, 14, 86);
  static const Color indigo = Color.fromARGB(255, 55, 35, 187);
  static const Color plum = Color.fromARGB(255, 54, 0, 90);
  static const Color gain = Color(0xFF3DDC84);
  static const Color loss = Color(0xFFFF5C6C);
}

ThemeData buildTheme(Brightness brightness) {
  final dark = brightness == Brightness.dark;
  final scheme = ColorScheme.fromSeed(
    seedColor: Brand.indigo,
    brightness: brightness,
    surface: dark ? const Color(0xFF14082E) : const Color(0xFFF6F3FF),
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: dark ? const Color(0xFF1B0E3F) : Colors.white,
      indicatorColor: scheme.primary.withValues(alpha: 0.25),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: scheme.onSurface.withValues(alpha: 0.06),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
  );
}

/// Full-screen background used behind every tab.
class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: dark
            ? const RadialGradient(
                center: Alignment(0, -0.2),
                radius: 1.3,
                colors: [Brand.indigo, Brand.plum, Brand.deepIndigo],
                stops: [0, 0.65, 1],
              )
            : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFEDE7FF), Color(0xFFF8F5FF)],
              ),
      ),
      child: child,
    );
  }
}

extension PriceColors on BuildContext {
  Color changeColor(double change) {
    if (change == 0) return Theme.of(this).colorScheme.onSurfaceVariant;
    return change > 0 ? Brand.gain : Brand.loss;
  }
}
