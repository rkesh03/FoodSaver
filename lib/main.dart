import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'models/food_item.dart';

// ---------- ENTRY ----------
import 'screens/splash_screen.dart';
import 'screens/role_selection_screen.dart'; // <-- ADD
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

// ---------- USER FLOW ----------
import 'screens/home_screen.dart';
import 'screens/donation_screen.dart';
import 'screens/donation_success_screen.dart';
import 'screens/requestfood_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/history_screen.dart';

// ---------- ADMIN FLOW ----------
import 'screens/admin_login_screen.dart'; // <-- ADD
import 'screens/admin_dashboard_screen.dart';
import 'screens/admin_users_screen.dart';       // TODO later
// import 'screens/admin_donations_screen.dart';   // TODO later
import 'screens/admin_reports_screen.dart';     // TODO later

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodSaver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppTheme.primaryGreen,
        scaffoldBackgroundColor: AppTheme.background,
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        // ---- ENTRY ----
        '/': (context) => const SplashScreen(),
        '/role': (context) => const RoleSelectionScreen(), // <-- ADD
        // ---- USER FLOW ----
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/donate': (context) => const DonationScreen(),
        '/donation_success': (context) => const DonationSuccessScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/history': (context) => const HistoryScreen(),

        // ---- ADMIN FLOW ----
        '/admin_login': (context) => const AdminLoginScreen(), // <-- ADD
        '/admin': (context) => const AdminDashboardScreen(),

        // ---- ADMIN (TODO later) ----
        '/admin_users': (context) => const AdminUsersScreen(),
        // '/admin_donations': (context) => const AdminDonationsScreen(),
        '/admin_reports': (context) => const AdminReportsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/requestfood') {
          final item = settings.arguments as FoodItem;
          return MaterialPageRoute(
            builder: (context) => RequestFoodScreen(item: item),
          );
        }
        return null;
      },
    );
  }
}
