import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'presentation/app.dart';

void main() async {
  runner();
}

void runner() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp();

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      runApp(const App());
    },
    (
      Object error,
      StackTrace stackTrace,
    ) {
      FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        reason: 'fatal error from runZonedGuarded',
        fatal: true,
      );
    },
  );
}
