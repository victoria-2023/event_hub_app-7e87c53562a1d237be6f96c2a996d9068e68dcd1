import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Event Hub',
      'description': 'Event Description Here',
    },
    'es': {
      'title': 'Centro de Eventos',
      'description': 'Descripción del Evento Aquí',
    },
    // Add other languages here
  };

  String get title {
    return _localizedValues[locale.languageCode]!['title']!;
  }

  String get description {
    return _localizedValues[locale.languageCode]!['description']!;
  }

  String get formattedDate {
    return DateFormat('yyyy-MM-dd', locale.languageCode).format(DateTime.now());
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es', 'fr', 'tr', 'et'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
