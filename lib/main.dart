import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n.dart'; // Import localization support file
import 'views/getting_started_view.dart';
import 'views/home_view.dart';
import 'views/event_creation_view.dart';
import 'views/login_view.dart';
import 'views/sign_up_view.dart';
import 'views/favorites_view.dart';

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
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orange,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFAF2EE),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.deepPurple),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
        Locale('fr', ''), // French
        Locale('tr', ''), // Turkish
        Locale('et', ''), // Estonian
      ],
      // Using named routes for easy navigation and management
      initialRoute: '/',
      routes: {
        '/': (context) => const GettingStartedView(),
        '/home': (context) => const HomeView(),
        '/login': (context) => LoginView(),
        '/signup': (context) => SignUpView(),
        '/createEvent': (context) => const EventCreationView(),
        '/favorites': (context) => const FavoritesView(favoriteEvents: []),
      },
    );
  }
}
