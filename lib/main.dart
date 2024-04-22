import 'package:flutter/material.dart';
import 'views/getting_started_view.dart';
import 'views/home_view.dart';
import 'views/event_creation_view.dart';
import 'views/login_view.dart';
import 'views/sign_up_view.dart';

void main() {
  runApp(const EventHubApp());
}

class EventHubApp extends StatelessWidget {
  const EventHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventHub',
      theme: ThemeData(
        primaryColor: Colors.deepPurple, // Updated primary color
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orange, // Updated secondary color (formerly accentColor)
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFAF2EE), // Beige color for the app bar background
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.deepPurple), // Consistent styling for text buttons
        ),
      ),
      // Using named routes for easy navigation and management
      initialRoute: '/',
      routes: {
        '/': (context) => const GettingStartedView(),
        '/home': (context) => const HomeView(),
        '/login': (context) => LoginView(),
        '/signup': (context) => SignUpView(),
        '/createEvent': (context) => const EventCreationView(),
      },
    );
  }
}
