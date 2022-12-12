// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Adult BMI Calculator`
  String get bmiCalculator {
    return Intl.message(
      'Adult BMI Calculator',
      name: 'bmiCalculator',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Calculate`
  String get calculate {
    return Intl.message(
      'Calculate',
      name: 'calculate',
      desc: '',
      args: [],
    );
  }

  /// `Under Weight (BMI=`
  String get underWeight {
    return Intl.message(
      'Under Weight (BMI=',
      name: 'underWeight',
      desc: '',
      args: [],
    );
  }

  /// `Try to reach`
  String get tryToReach {
    return Intl.message(
      'Try to reach',
      name: 'tryToReach',
      desc: '',
      args: [],
    );
  }

  /// `Congrats, right weight (BMI=`
  String get rightWeight {
    return Intl.message(
      'Congrats, right weight (BMI=',
      name: 'rightWeight',
      desc: '',
      args: [],
    );
  }

  /// `Slightly Overweight (BMI=`
  String get slightlyOverweight {
    return Intl.message(
      'Slightly Overweight (BMI=',
      name: 'slightlyOverweight',
      desc: '',
      args: [],
    );
  }

  /// `Class 1 Obesity (BMI=`
  String get class1 {
    return Intl.message(
      'Class 1 Obesity (BMI=',
      name: 'class1',
      desc: '',
      args: [],
    );
  }

  /// `Class 2 Obesity (BMI=`
  String get class2 {
    return Intl.message(
      'Class 2 Obesity (BMI=',
      name: 'class2',
      desc: '',
      args: [],
    );
  }

  /// `Class 3 Obesity (BMI=`
  String get class3 {
    return Intl.message(
      'Class 3 Obesity (BMI=',
      name: 'class3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}